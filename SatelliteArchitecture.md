# GWU CUBE SATELLITE SYSTEMS ARCHITECTURE

## SYSTEMS ARCHITECTURE

- **Main.c**
  - Project code

- **Salvocfg.h**
  - Salvo specific config
  
- **Satellite_def.h**
  - Project Definitions

### Key Ideas
- Uses the Salvo Library for Multi-tasking
- A System of Semaphores and Delays to Call Tasks

## TASKS
The tasks below are used to conduct critical OPS

- `TaskSysInit`
  - Starts a 30 minute timer at initial deployment as per NanoRacks Requirement
- `TaskStartSystem`
    - Creates all below tasks
  - `TaskPowerLvL`
      - Checks power LvL intermittenly
      - Pauses OPS if LvL is too low 

  - `TasksDataPrep`
      - Prepares Data for transmit by taking the system state

  - `TaskComms`
      - Transmits based on if we are over the ground

  - `TaskExp`

## SYSTEMS THINKING
- System Clock of 1 second
- Orbit Period of 93 minutes
- Orbit Lifespan TBR
- OS_Delay() used to control many timings
