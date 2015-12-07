# Protocol for Running MOCO Psychophysics Experiment

Author: Andrea Seisler
Created: 2015-09-25
1. Use Mac in room 449A Moore2. Log in to Admin Rick Gilmore account with password imac1234%3. Make sure connected to psu Wifi4. Open MATLAB by clicking on the logo on bottom toolbar (**Matlab_R2013b**)5. Enter command: rdkMain(‘oldload’)The following should come up:6. Open src->local->exec->RDK->exp->
    - 20150706_1045 > obj.mat
    - 20150706_1115 > obj.mat    7. Participants should be seated 60 cm from the monitor8. Participant Instructions:   
    - Fixate on the dot in the center of the display and to use your peripheral vision to determine which of the displays exhibits an optic flow pattern.
    - There is a 10 second response time limit
    - We will take a break half way through the study.
- Wait for program to launch9. Press space bar to begin when prompted10.	Press space bar again to bring up fixation point11.	Press space bar once more to bring up side-by-side circular dot displays12.	Choose which display is exhibiting motion coherence by pressing the ‘z’ for left or the ‘?/’ key for the right13.	Repeat steps 10-12 until the program ends
### Notes
####How many Blocks do I run?  
- 1 run = 5 blocks of 16 trials  - Randomize Blocks  Adults: 2 runs of each type    

- 2 deg/sec [.05,.10,.15,.20]  
- 8 deg/sec [.05,.10,.15,.20]  

Children: 2 runs of each type  

- 2 deg/sec [.2,.4,.6,.8]  
- 8 deg/sec [.2,.4,.6,.8]  

#### Response Keys
|code name| keyboard key| Description             | 
|---------|-------------|-------------------------| 
| spkey   | space bar   | Progress to next screen |  
| esckey  | esc         | Abort display sequence  |  
| pkey    | P           | Go to previous trial    | 
| lkey    | L           | Left Response           |
| rkey    | ?/          | Right Response          |
Protocol for Retrieving Session Data  1.	Open Excel  2.	Open src->local->exec->RDK->exp->20140922_04033.	Enable “All Files” at bottom 4.	Open ‘out.csv’