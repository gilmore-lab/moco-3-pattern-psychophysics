# Post-processing steps
# 2014-10-30

1. Open *.xlsx files in Excel
2. Add column to left hand side of file (to the left of Block) that indicates the run. Run number should be indicated in the filename. Copy the run number across the rows.
3. Add Coh, Temp, TotCorr, TotCond, PctCorr, degPSec as column labels in row 1.
4. Insert formula to calculate Coh. Coh is the sum of LeftCoh and RightCoh.
5. Insert formula to calculate Temp. Temp just converts the TRUE/FALSE values of Acc to 1, 0 values.
6. Sort the table on Coh, then PatternType.
7. Insert formula to calculate TotCorr. TotCorr is the sum of Temp over the lowest Coh and PatternType.
8. Insert formula to calculate TotCond. TotCond is the number of replications in this condition. It is the count of rows in a given combination of Coh and PatternType.
9. Insert formula to calculate PctCorr. This is just TotCorr/TotCond.
10. Insert degPSec from file name.
11. Check the modifications.
12. Export as .csv.