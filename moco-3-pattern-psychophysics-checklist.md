# MOCO 3 Pattern Psychophysics Checklist

Authors: William Adamiak & Rick O. Gilmore (rick.o.gilmore@gmail.com)

Date: 2015-04-24

## Startup

-   Open **Matlab R2010aSV** (if Matlab error shows up, dismiss)
    
    ![](img/desktop.png)

-   Go to current working directory (~/Documents/MATLAB/GitHub/RDK)

![](img/path-to-matlab-script.png)

-   To change parameters: select an obj.mat file from a participant folder in the exp folder (see below).

-   rdkMain is the primary function for this experiment that accepts one argument. To execute it, enter in the Matlab command window. The syntax for running the command is: rdkMain(‘argument’). The argument value must be contained in single quotes.

-   rdkMain allows for 3 options to pass as an argument. They are:
	- ’prepare’, to make new stimuli
	- ‘newrun’, to run a new pattern on the fly
	- ‘oldload’, to load pre-generated stimuli.

## Prepare

- Below is an example command window during ‘prepare’.
- RDK will ask for the number of iterations (any numeric value), testing date (YYYYMMDD), and testing time (HHMM).
- The command window will then show a report of block/trial completed and a countdown of how much longer that trial will take to complete.
- Prior to each iteration of dot generation, RDK will request a new testing date/time for that dot set.
- Note that this option does not present dots in any way. It simply “prepares” dots for future use. The files generated are Matlab data structures containing (among other items) bitmaps of the two dot display regions for each frame in the movie.

![](img/prepare-stimuli-output.png)

## New run

- During ‘newrun’, one iteration of dots is created and the display sequence begins immediately after.
- As such, testing date and time will be requested upon script execution.
- See below for presentation format.
- This is useful for seeing the effects of particular parameters.

## Old load

- For rdkMain(‘oldload’), select an **obj.mat** file within the ./exp/previous\_participant\_folder.

- The ‘oldload’ option ignores dot generation entirely, and assumes that a dot set has already been pre-generated (obj.mat).

- As such, ‘oldload’ will start dot presentation as soon as an obj.mat is selected.

![](img/load-old-stimuli.png)

![](img/select-file-to-load.png)

## Presentation format

1. Participant will see welcome screen.

2. Next PsychToolbox screen will show briefly.

3. A blank screen will show. Here participant presses spacebar to
continue.

4. Next a fixation screen with a white dot in the center of the screen
will show. Here participant presses spacebar to begin the trial.

5. The dots are displayed and participants respond with key presses (Z
for left image, ? for right image) \*the Matlab command window keeps
track of key presses. Participants have 10 sec to respond

6. Repeat steps 3-5 for every trial.

![](img/sample-display.png)

## End of session

![](img/output-file-path.png)

- After experiment is complete, an out.csv is created in the subject’s folder.

- Select the out.csv file to view participant performance (Ctrl+Click \>\> Select *Open Outside Matlab*)

- Rename this file with participant ID and session date information.

![](img/output-file-view.png)

- Session files are stored on ~/Box Sync/gilmore-lab/projects/optic-flow/optic-flow-psychophysics/projects/moco-3-pattern-psychophysics/adult-laminar-radial/data in a directory with the session test date and a 3 digit participant number (YY-MM-DD-SSS).

## Data merging, cleaning with RStudio

- An [RStudio](http://www.rstudio.com/) project is located in ~/Box Sync/gilmore-lab/projects/optic-flow/optic-flow-psychophysics/projects/moco-3-pattern-psychophysics/adult-laminar-radial/analysis
- Open RStudio, then navigate to this directory and open the *analyses.Rproj* file or select this project from the menu.
- The *william.R* script can be run. It creates and cleans a merged data file, exports new .csv files to subject directories, conducts statistical analyses, and creates several useful plots.

## Uploading data to Databrary

- The data for this project are shared with Databrary under <http://databrary.org/volume/73>


## Manipulate experimental parameters

-   To view previous experimental parameters, select an obj.mat within a subject folder in the exp/ directory.

- To manipulate experimental parameters prior to dot generation, open the **ObjSet.m**, and adjust the values below.

- Highlighted are the parameters that are flexible to change (except exp.fr).

- Always verify changes with those with experience before saving.

![](img/manipulate-experimental-parameters.png)

![](img/manipulate-experimental-parameters-2.png)