# Protocol for Running MOCO Psychophysics Experiment

Author: Andrea Seisler
Created: 2015-09-25
1. Use Mac in room 449A Moore2. Log in to Admin Rick Gilmore account with password imac1234%3. Make sure connected to psu Wifi4. Open MATLAB by clicking on the logo on bottom toolbar (**Matlab_R2013b**)  
![Matlab icon](imgs/Matlab-icon.png)5. Enter command: rdkMain(‘oldload’)  The following should come up:![Select File to Load](imgs/Choose-file.jpg)  
6. Navigate to:![Select File to Load](imgs/Choose-file2.jpg)7. Open src->local->exec->RDK->exp->

    - 20150706_1045 > obj.mat
      - velocity = 8 deg/s
      - coherence = [.2,.4,.6,.8]  
          - 20150706_1115 > obj.mat      - velocity = 2 deg/s
      - coherence = [.2,.4,.6,.8]  
      
      8. Participants should be seated 60 cm from the monitor9. Participant Instructions:   
    - Fixate on the dot in the center of the display and to use your peripheral vision to determine which of the displays exhibits an optic flow pattern.
    - There is a 10 second response time limit
    - We will take a break half way through the study.
10. Participant will see welcome screen
11. Next PsychToolbox screen will show briefly
12. A blank screen will appear
13. Press space bar to begin
14. Press space bar again to bring up fixation point
15. Press space bar once more to bring up side-by-side circular dot displays
16. Choose which display is exhibiting motion coherence by pressing the ‘z’ for left or the ‘?/’ key for the right
17. Repeat steps 14-16 until the program ends
### Notes
####How many Blocks do I run?  
- 1 run = 5 blocks of 16 trials  - Randomize Blocks  Adults: 2 runs of each type    

- 2 deg/sec [.05,.10,.15,.20]  
- 8 deg/sec [.05,.10,.15,.20]  

Children: 2 runs of each type  

- 20150706_1115 > obj.mat: 2 deg/sec [.2,.4,.6,.8]  
- 20150706_1045 > obj.mat: 8 deg/sec [.2,.4,.6,.8]  

#### Response Keys
|code name| keyboard key| Description             | 
|---------|-------------|-------------------------| 
| spkey   | space bar   | Progress to next screen |  
| esckey  | esc         | Abort display sequence  |  
| pkey    | P           | Go to previous trial    | 
| lkey    | Z           | Left Response           |
| rkey    | ?/          | Right Response          |
Protocol for Retrieving Session Data  1.	Open Excel  2.	Open src->local->exec->RDK->exp->20140922_04033.	Enable “All Files” at bottom 4.	Open ‘out.csv’