# GWU-Sat

This is the beginning of the codebase for GWU-Sat which aims to send experimental thruster units into LEO.


**Programming Language**

***This project will be programmed mainly using C for the OBC system and ADCS portion of the project.***
Unless Stated all programming files will be inside the **SAT** Folder

## Things to Do

**Priority**
- Build inside compiler
    - [x] Run Simulator
    - [x] Include introductory tasks like StartSysten and SystemInit
    - [x] Create all basic system tasks

- Build example file onto PPM D
    - [ ] Get to compile and push, must use pick-it 3

---------------------------------------------

- Begin Testing of components 
    - [ ] Battery
    - [ ] EPS
    - [ ] OBC
    - [ ] ADCS
- Create Barebones start-up system
    - [ ] Send Pings to each individual component
    - [ ] Build correct i2C constructor for each component if they differ
    - [x] Begin a timer
    - [ ] Conduct Long haul test of each version (30 minutes using significantly reduced OS_Delay() times) 
- Thrusters
    - [ ] Inside Main.c and satellite_defs.h make experiments 1 through 6, right now I only have a general ***void TaskExecuteExperiment(void)*** function
    - [ ] Need to somehow translate code into actions since this is all devolped in house (No pre-defined functions like we would usually have)



