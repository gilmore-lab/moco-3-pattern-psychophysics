# moco-behavior-report
Rick O. Gilmore  
`r Sys.Date()`  





## Summary of participant ages, gender: adult group


         Female   Male
------  -------  -----
<18yo         0      0
18yo          1      1
19yo         10      1
20yo          0      3
21yo          4      2
22yo          1      6
23yo          0      1

## Plot of *p*(corr): adult group

![](img/adult/p.corr.plot-1.png)<!-- -->

## Plot of reaction time: adult group

![](img/adult/rt.plot-1.png)<!-- -->

## Linear mixed effects modeling of *p*(corr): adult group


                         numDF   denDF       F-value     p-value
----------------------  ------  ------  ------------  ----------
(Intercept)                  1     443   217.5282754   0.0000000
Coh                          1     443   426.8725684   0.0000000
PatternType                  1     443     6.5638986   0.0107366
Speed                        1     443     2.7280205   0.0993100
Coh:PatternType              1     443    17.0116190   0.0000444
Coh:Speed                    1     443     0.0301918   0.8621351
PatternType:Speed            1     443     4.6195483   0.0321506
Coh:PatternType:Speed        1     443     3.1144806   0.0782882

## Evaluate Speed effect



![](img/adult/p.corr.by.spd.plot-1.png)<!-- -->

## Evaluate Pattern effects



![](img/adult/coh.by.pattern.plot-1.png)<!-- -->
