# project-notes-moco-3-pattern-psychophysics

This is the project notes file for the moco-3-pattern-psychophysics project.

## Goal
- collect data from XX children 4-8 yrs old.
- compare child with previously collected adult data

## To Do
- Set up USB controller to work with study - DONE
  - code uses KbName which only works with the keyboard - uses PsychHID to make work with multiple input devices - Updated
  - write new script to detect responses
  
- Pilot on kids


## 2016-02-18-12:45
- Meeting: Rick, Andrea, Raya, Shivani, Karina  
- Reviewed changes to code  
- Discussed piloting study  
   - set up camera - determine camera angle  
   - acquire light for in the room that has a dimmer  
   - maybe have young participants point to the screen and have the experimenter press the button  
- Write procedure for setting up camera.  
- Write instructions for utilizing the keyboard/game controller and pointing.   
  	
## 2016-02-18-10:00
- ars17 limited the allowable of key responses to the defined esckey, pkey, lkey, rkey, and spkey. This works for the keyboard and the game controller
	- issues - the spkey works during the dot display and it pressed logs a '0' 
- fixed the exiting out of the block/trial loop so the end of the study does not sound like an error.

## 2016-01-27-16:00
- pilot study 7 yo M

- Accept any key input response
- Script froze - no output .csv files were generated
- problems keeping fingers on the correct buttons
- more light needed

## 2016-01-20-09:00
- Completed updating instructions to include filenaming conventions and updating images 

## 2016-01-19-11:30
- Rename the folders where the .mat files are to the following:  
	- child_2deg/s_output > obj-2degPs-child.mat    v = 2 deg/s   coherence = [.2 .4 .6. 8]  
	- child_8deg/s_output > obj-8degPs-child.mat    v = 8 deg/s   coherence = [.2 .4 .6. 8]  	- 2 deg/s output-adult > obj_2degPs.mat	     v = 2 deg/s    coherence = [.05 .10 .15 .20]  
 	- 8 deg/s output-adult > obj_8degPs.mat	     v = 8 deg/s    coherence = [.05 .10 .15 .20] 

## 2016-01-05-12:00
- Alter matlab code rdkMain.m, objSet.m, and added script inputDevice() to allow additional input devices to be used.
- Sabarent 12 button USB game pad may now be used.

## 2015-12-17-10:40

- ars17 finished updating protocol instrutions and adding images


## 2015-09-23-12:10

- ars17 created this project notes file and pushed it to GitHub.






