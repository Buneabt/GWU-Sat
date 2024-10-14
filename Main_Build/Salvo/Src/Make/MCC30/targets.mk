###########################################################################################
#
#   targets: libraries for Microchip MPLAB C30 C compiler. 
#
#   libsalvo[f|l][mcc30|mcc30e][s|l][-|i][a|d|e|m|t].a
#
#   [f|l]:          freeware or standard library
#   [mcc30|mcc30e]: generic 16-bit (PIC24F) or generic 16bit EP (PIC24E)
#   [s|l]:          small (16-bit) or large (24-bit) memory model
#   [-|i]:          debug information included
#   [a|d|e|m|t]:    Salvo library types
#
#   Libraries for standard (PIC24/dsPIC33) and optional (PIC24E/dsPIC33E) targets
#    are built together.
#
MCC_PIC24_STD_FAMILIES        =   mcc30
MCC_PIC24_OPT_FAMILIES        =   mcc30-opt
MCC_PIC24E_STD_FAMILIES       =   mcc30e
MCC_PIC24E_OPT_FAMILIES       =   mcc30e-opt


###########################################################################################
#
# Included in Salvo distributions.
#
# We only built t-config libraries for the large model since it's not sensitive to 
#  code size ...
#
MCC_PIC24_STD_LIBRARIES       = $(MCC_PIC24_STD_LIBRARIES_F_N) \
                                $(MCC_PIC24_STD_LIBRARIES_L_N) \
                                $(MCC_PIC24_STD_LIBRARIES_L_I) 

MCC_PIC24_STD_LIBRARIES_F_N   = libsalvofmcc30s-t.a \
                                libsalvofmcc30l-t.a 
                                
MCC_PIC24_STD_LIBRARIES_L_N   = libsalvolmcc30s-a.a \
                                libsalvolmcc30s-d.a \
                                libsalvolmcc30s-e.a \
                                libsalvolmcc30s-m.a \
                                libsalvolmcc30s-t.a \
                                libsalvolmcc30l-t.a 
                                
MCC_PIC24_STD_LIBRARIES_L_I   = libsalvolmcc30sia.a \
                                libsalvolmcc30sid.a \
                                libsalvolmcc30sie.a \
                                libsalvolmcc30sim.a \
                                libsalvolmcc30sit.a \
                                libsalvolmcc30lit.a 
         
                                
MCC_PIC24E_STD_LIBRARIES      = $(MCC_PIC24E_STD_LIBRARIES_F_N) \
                                $(MCC_PIC24E_STD_LIBRARIES_L_N) \
                                $(MCC_PIC24E_STD_LIBRARIES_L_I) 

MCC_PIC24E_STD_LIBRARIES_F_N  = libsalvofmcc30es-t.a \
                                libsalvofmcc30el-t.a 
															
MCC_PIC24E_STD_LIBRARIES_L_N  = libsalvolmcc30es-a.a \
                                libsalvolmcc30es-d.a \
                                libsalvolmcc30es-e.a \
                                libsalvolmcc30es-m.a \
                                libsalvolmcc30es-t.a \
                                libsalvolmcc30el-t.a 
   
MCC_PIC24E_STD_LIBRARIES_L_I  = libsalvolmcc30esia.a \
                                libsalvolmcc30esid.a \
                                libsalvolmcc30esie.a \
                                libsalvolmcc30esim.a \
                                libsalvolmcc30esit.a \
                                libsalvolmcc30elit.a 
   


###########################################################################################
#
# Optional. Does not include libraries already part of the standard set.
#
MCC_PIC24_OPT_LIBRARIES       = $(MCC_PIC24_OPT_LIBRARIES_F_N) 

MCC_PIC24_OPT_LIBRARIES_F_N   = libsalvofmcc30s-a.a \
                                libsalvofmcc30s-d.a \
                                libsalvofmcc30s-e.a \
                                libsalvofmcc30s-m.a


MCC_PIC24E_OPT_LIBRARIES      = $(MCC_PIC24E_OPT_LIBRARIES_F_N) 

MCC_PIC24E_OPT_LIBRARIES_F_N  = libsalvofmcc30es-a.a \
                                libsalvofmcc30es-d.a \
                                libsalvofmcc30es-e.a \
                                libsalvofmcc30es-m.a


                             
                                              
