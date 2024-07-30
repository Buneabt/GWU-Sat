# GWU-Sat

This is the beginning of the codebase for GWU-Sat which aims to send experimental thruster units into LEO.


**Programming Language**

***This project will be programmed mainly using C for the OBC system and MatLab for the ADCS portion of the project.***
***Unles Stated all programming files will be inside the **SAT** Folder***

## Things to Do

- Build example file onto PPM D
    - [ ] Get to compile, must use pick-it 3
    - [ ] 
- Begin Testing of components 
    - [ ] Battery
    - [ ] EPS
    - [ ] OBC
    - [ ] ADCS
- Create Barebones start-up system
    - [ ] Send Pings to each individual component
    - [x] Begin a timer
- Thrusters
    - [ ] Inside Tasks.c and Tasks.h make experiments 1 through 6, right now I only have a general ***void TaskExecuteExperiment(void)*** function
    - [ ] Need to somehow translate code into actions since this is all devolped in house (No pre-defined functions like we would usually have)



