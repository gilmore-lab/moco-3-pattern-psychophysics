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

## Plot of reaction time: `r params$group' group

![](img/child/rt.plot-1.png)<!-- -->

## Plot of *p*(corr) by age in years: child group

![](img/child/p.corr.by.age-1.png)<!-- -->

## Linear mixed effects modeling of *p*(corr): child group


                         numDF   denDF        F-value     p-value
----------------------  ------  ------  -------------  ----------
(Intercept)                  1     428   7138.6009013   0.0000000
Coh                          1     428    284.4363095   0.0000000
PatternType                  1     428     53.3911843   0.0000000
Speed                        1     428     18.0007739   0.0000271
Coh:PatternType              1     428     18.7436630   0.0000186
Coh:Speed                    1     428      0.6711562   0.4131047
PatternType:Speed            1     428      0.3755717   0.5403083
Coh:PatternType:Speed        1     428      1.4353557   0.2315554

## Evaluate Coherence x Speed interaction



![](img/child/p.corr.by.spd.plot-1.png)<!-- -->

## Evaluate Coherence x Pattern interaction



![](img/child/coh.by.pattern.plot-1.png)<!-- -->
