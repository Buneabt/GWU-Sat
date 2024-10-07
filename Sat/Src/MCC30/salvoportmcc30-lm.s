; /********************************************************** 
; The contents of this file are subject to the Pumpkin Salvo
; License (the "License").  You may not use this file except
; in compliance with the License. You may obtain a copy of
; the License at http://www.pumpkininc.com, or from
; warranty@pumpkininc.com.
;
; Software distributed under the License is distributed on an
; "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express
; or implied. See the License for specific language governing
; the warranty and the rights and limitations under the
; License.
;
; The Original Code is Salvo - The RTOS that runs in tiny
; places(TM). Copyright (C) 1995-2006 Pumpkin, Inc. and its
; Licensor(s). All Rights Reserved.
;
; $Source: C:\\RCS\\D\\Pumpkin\\Salvo\\Src\\MCC30\\salvoportmcc30-lm.s,v $
; $Author: aek $
; $Revision: 3.8 $
; $Date: 2016-03-05 12:25:32-08 $
;
; Context switcher for PIC24/PIC24E & dsPIC33/dsPIC33E when using Microchip 
;  MPLAB C30 C compiler for the large code model. 
;
; MCC30 Calling Convention (4.11 "Function Call Conventions"):
; * Registers W0-W7 are caller saved. The calling function must push these values 
;   onto the stack for the register values to be preserved.
; * Registers W8-W14 are callee saved. The function being called must save any of 
;   these registers it will modify.
; * Registers W0-W4 are used for function return values.
;
; Therefore, for our purposes here:
;   W0-W7         scratch 
;   W8-W13,FP,SP  "preserved across ordinary function calls"   
;   PC            full 24-bit PC (0:PCH:PCL)
;
; Register Usage:
;   W0-W2         used                    
;   W2-W7         unused
;   W8-W13        unused, optionally preserved
;   W14(FP)       preserved across task dispatches
;   W15(SP)       preserved across task dispatches
;   PC            changed via GOTO instruction
;
; Note that neither call nor goto will span more than the first
;  32K instructions of program memory ... use of rcall could 
;  effectively double that range at a cost of the time to push
;  the return address (which we don't need) as well as to do the
;  computation
;
; **********************************************************/
        .text
        
        .equ    SAVE_W8_W13,1       ; 0: don't save W8-W13 
                                    ; 1: save W8-W13
        
        .equ    SIZEOF_RTN_ADDR,4   ; in bytes
                                          
        .equ    FP,w14              ; alias
        .equ    SP,w15              ; alias

        .equ    SAVED_REGS_OFFSET,8 ; in bytes, offset from start of tcb
                                    ;  to savedRegs block.
        .equ    SAVE_REG_SIZE,2     ; in bytes, size of each saved reg


;/********************************************************** 
;****                                                   ****
;**                                                       **
;  macros
;
;
;**                                                       **
;****                                                   ****
;**********************************************************/

        .macro    save_w8_w13            
.if SAVE_W8_W13
        ; 
        ; Save W8-W13 to stack
        ;
        push.d    w8              ; save some code space by
        push.d    w10             ;  using push.d instead of
        push.d    w12             ;  push.w
.endif 
        .endm
        
        
        .macro    restore_w8_w13            
.if SAVE_W8_W13
        ; 
        ; Restore W8-W13 from stack
        ;
        
        pop.d    w12          
        pop.d    w10            
        pop.d    w8          
.endif                
        .endm
        
        

;/********************************************************** 
;****                                                   ****
;**                                                       **
;  void OSDispatch (void)
;
;   Replaces call-by-pointer in OSSched(). Replacement is
;    necessary because context switcher is a function, and
;    needs to know how large the task's stack frame is. Mark 
;    the SP and FP in OSDispatch() and then compare it to SP in 
;    OSCtxSw(). If a task has no auto variables, OSframeP and
;    SP will differ by 4 bytes in OSCtxSw().
;
;  Assumes:  rtn address (to scheduler, 4 bytes) is 
;             already on stack.
;
;  Changes:  OSframeP, FP, SP, PC 
;
;  Destroys: W0, W1
;
;  Speed:    ?? cycles, including an RCALL to this
;             routine and the GOTO to the task
;
;  Notes:    It's important to note that tasks will use 
;             the LNK instruction, but they'll never get 
;             a chance to UNLK. Therefore we have to keep 
;             in mind that once we're in a task, we'll 
;             have to undo its stack frame later in 
;             OSCtxSw().
;
;            PIC24/30 is 16/24 bit. SP counts 8-bit bytes,
;             grows upwards towards high memory. Push is 
;             [SP]++.
;  
;            frameSize is 16 bits.
;
;            Can't use goto for 24-bit jumps, as goto 
;             supports only literals or register (16 bit).
;
;            PIC24E's implementation of LNK/UNLK and SFA
;             bit complicates things dramatically, 
;             therefore auto-stack-frame-pointer via SFA
;             is not used, and therefore not affected.
;
;**                                                       **
;****                                                   ****
;**********************************************************/

        .global   _OSDispatch
        
_OSDispatch:

        ;
        ; Call save of W8-W13
        ;
        
        save_w8_w13            

        ;
        ; Save FP to stack; 
        ; FP          = SP; 
        ; OSframeP    = SP; 
        ;
        ; Create an empty stack frame for the task about to
        ;  be called:
        ;        
        ; While a LNK #0 instruction is more efficient, it complicates
        ;  the issue because odds are high that the task and its called
        ;  functions will also implement stack frames via LNK. That's 
        ;  a problem on PIC24E, because SFA must not be set when LNK 
        ;  is executed. By transparently saving FP here and restoring 
        ;  it later, we avoid the SFA bit issue altogether ...
        ;
        push.w    FP              ; FP saved to stack
        mov.w     SP,FP           ; empty stack frame means FP = SP
        mov.w     SP,_OSframeP    ; save stack pointer to calculate 
                                  ;  frameSize in OSCtxSw()

        ;
        ; Get handle to current task's tcb
        ;
        
        mov.w     _OScTcbP,w0     ; W0: -> current tasks's tFP
        
        ;
        ; SP += frameSize;
        ;
        
        mov.w     [w0+2],w1       ; get task's frameSize
        add.w     SP,w1,SP        ; redefine SP (atomic)

        ;
        ; Restore w8..w13 (from OScTcbP->savedRegs[0..5]) from last time
        ;  we were in the task.
        ;
        
        mov.w     [w0+SAVED_REGS_OFFSET+0*SAVE_REG_SIZE],w8
        mov.w     [w0+SAVED_REGS_OFFSET+1*SAVE_REG_SIZE],w9
        mov.w     [w0+SAVED_REGS_OFFSET+2*SAVE_REG_SIZE],w10
        mov.w     [w0+SAVED_REGS_OFFSET+3*SAVE_REG_SIZE],w11
        mov.w     [w0+SAVED_REGS_OFFSET+4*SAVE_REG_SIZE],w12
        mov.w     [w0+SAVED_REGS_OFFSET+5*SAVE_REG_SIZE],w13

        ;
        ; OScTcbP->tFP();
        ;
        ; This is effectively a jump-to-subroutine, as we won't be coming
        ;  back to this function ...
        ;
        mov.w     [w0+6],w1        ; branch to task's start/resume
        mov.w     [w0+4],w0        ;  address, via a full 24-bit
                                   ;  address (push, then pop)

        bclr      w0,#0            ; safety -- addresses must always be even         

        push.d    w0               ; clean way to vector to task over              
        return                     ;  entire address range
       
        ;
        ; End of OSDispatch()
        ;


;/********************************************************** 
;****                                                   ****
;**                                                       **
;  void OSCtxSw (void)
;
;  Since SP can be changed atomically and LNK/ULNK opcodes
;    are available, this is all pretty quick.
;
;  Assumes:   Task's return address is on the stack. 
;
;  Changes:   current task's tFP 
;             current task's frameSize field
;             FP, SP
;
;  Destroys:  W0, W1
;
;  Speed:     15 cycles, including an RCALL to this
;              routine and the return to the scheduler.
;
;  Notes:     Reloads FP from OSframeP.
;
;             To be able to use ULNK to de-allocate the 
;              stack frame, we need to redefine FP. We 
;              redefine FP to its value early in 
;              OSDispatch(). Since OSCtxSw() does not use
;              FP, any interrupts that might occur between 
;              the redefinition of FP and the ULNK 
;              instruction cannot cause harm, because SP 
;              is by definition at a higher address than 
;              FP.
;
;**                                                       **
;****                                                   ****
;**********************************************************/

        .global   _OSCtxSw
        .global   _OSReturn

_OSCtxSw:

        ;
        ; OScTcbP->tFP = return address on stack;
        ; Since OSCtxSw() is an assembly-language void fn (void),
        ;  the return address we want is the most recently pushed
        ;  data on the stack (32 bits total) ...
        ;
        
        mov.w     _OScTcbP,w0     ; W0: -> current tasks's tFP
        mov.w     [SP-4],w1       ; W1 = [15..0] of return address
        bclr      w1,#0           ; safety -- addresses must always be even        
        mov.w     w1,[w0+4]       ; write to task's tFP[15..0]
        mov.w     [SP-2],w1       ; W1 = [23..16] of return address
        mov.w     w1,[w0+6]       ; write to task's tFP[23..16]

        ;
        ; OScTcbP->status.bits.frameSize = SP - (OSframeP + sizeof(rtn addr));
        ;
                
        mov.w     _OSframeP,w1     ; write new frameSize
        add.w     w1,#SIZEOF_RTN_ADDR,w1  ;  to tasks's frameSize field
        sub.w     SP,w1,w1         ;  ""
        mov.w     w1,[w0+2]        ;  ""

        ;
        ; The task (through the actions of the compiler) may have changed 
        ;  W8-W13 at this point! This is true even though the task's called functions
        ;  have saved W8-W13. 
        ; Therefore, save w8..w13 (to OScTcbP->savedRegs[0..5]) for the next time
        ;  we're in the task.
        ;

        mov.w     w8,[w0+SAVED_REGS_OFFSET+0*SAVE_REG_SIZE]
        mov.w     w9,[w0+SAVED_REGS_OFFSET+1*SAVE_REG_SIZE]
        mov.w     w10,[w0+SAVED_REGS_OFFSET+2*SAVE_REG_SIZE]
        mov.w     w11,[w0+SAVED_REGS_OFFSET+3*SAVE_REG_SIZE]
        mov.w     w12,[w0+SAVED_REGS_OFFSET+4*SAVE_REG_SIZE]
        mov.w     w13,[w0+SAVED_REGS_OFFSET+5*SAVE_REG_SIZE]

      
        ;
        ; Restore SP & FP;
        ;
        ; No need to control interrupts because we're moving DOWN
        ;  over no longer used data in a single, atomic instruction
        ;
       
                                   ; w1: frameSize
        add.w     w1,#SIZEOF_RTN_ADDR,w1  ; w1: sizeof(no longer used stuff
                                          ;  on stack)
_OSReturn2:      
        sub.w     SP,w1,SP         ; deallocate stack frame & skip over
                                   ;  task pointer
        pop.w     FP               ; restore OSSched()'s FP
                
        ;
        ; Callee restore of W8-W13
        ;
                
        restore_w8_w13            

        ;
        ; SP: -> return address (in scheduler)
        ; Return to OSSched();
        ;

        return
        
        ;
        ; End of OSCtxSw()
        ;

		;
		; Used only by OS_Replace(), this represents a way to 
		;  "undo" an OS_Dispatch() directly ... since this is
		;  (only) done immediately after a task is created, 
		;  this is the required stack adjustment when the task
		;  has no frame (yet) ...
_OSReturn:
		mov.w	#2+SIZEOF_RTN_ADDR,w1
		bra		_OSReturn2              
     
;/********************************************************** 
;****                                                   ****
;**                                                       **
;  OStypeRawTFP OSDethunkTFP (void *)
;
;  Converts a 16-bit task start address to 32 bits. This
;   works because when a task's entry point is specified
;   by the compiler as a 16-bit address to a jump table in
;   lower memory. The dispatcher will vector through this
;   jump table to the entry point in the task function.
;   Note that this only happens once per task ... when we
;   return to the scheduler via OSCtxSw(), we store a full
;   24-bit return address in the tcb, that will be used to
;   return to / resume the task later.
;
;  Assumes:   Task's function pointer is in W0
;
;  Changes:   W1
;
;  Destroys:  W1
;
;**                                                       **
;****                                                   ****
;**********************************************************/
     
        .global   _OSDethunkTFP

_OSDethunkTFP:
        ;
        ; return [W1][W0] = [0000][W0] 
        ;
        mov.w     #0,w1
        return   
        
        ;
        ; End of PSDethunkTFP()
        ;
          
    
             
;/********************************************************** 
;****                                                   ****
;**                                                       **
;  end of module  
;
;**                                                       **
;****                                                   ****
;**********************************************************/

        .end
        