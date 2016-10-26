# moco-behavior-report
Rick O. Gilmore  
`r Sys.Date()`  





## Summary of participant ages, gender: child group


        Female   Male
-----  -------  -----
<5yo         0      0
5yo          7      2
6yo          6      2
7yo          5      4
8yo          1      2

## Plot of *p*(corr): child group

![](img/child/p.corr.plot-1.png)<!-- -->

## Plot of reaction time: child group

![](img/child/rt.plot-1.png)<!-- -->

## Linear mixed effects modeling of *p*(corr): child group


                         numDF   denDF       F-value     p-value
----------------------  ------  ------  ------------  ----------
(Intercept)                  1     428   106.5989785   0.0000000
Coh                          1     428   240.5392908   0.0000000
PatternType                  1     428    46.2603639   0.0000000
Speed                        1     428    12.8704304   0.0003724
Coh:PatternType              1     428    21.9686383   0.0000037
Coh:Speed                    1     428     0.6809193   0.4097300
PatternType:Speed            1     428     0.1090524   0.7413872
Coh:PatternType:Speed        1     428     1.7828600   0.1825082

## Evaluate Speed effect



![](img/child/p.corr.by.spd.plot-1.png)<!-- -->

## Evaluate Pattern effects



![](img/child/coh.by.pattern.plot-1.png)<!-- -->
