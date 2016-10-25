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

## Plot of reaction time: `r params$group' group

![](img/adult/rt.plot-1.png)<!-- -->

## Plot of *p*(corr) by age in years: adult group

![](img/adult/p.corr.by.age-1.png)<!-- -->

## Linear mixed effects modeling of *p*(corr): adult group


                         numDF   denDF       F-value     p-value
----------------------  ------  ------  ------------  ----------
(Intercept)                  1     443   2394.778504   0.0000000
Coh                          1     443    564.332328   0.0000000
PatternType                  1     443     13.252590   0.0003043
Speed                        1     443      4.337903   0.0378459
Coh:PatternType              1     443     25.961213   0.0000005
Coh:Speed                    1     443      0.060218   0.8062654
PatternType:Speed            1     443      3.631913   0.0573286
Coh:PatternType:Speed        1     443      1.992820   0.1587484

## Evaluate Coherence x Speed interaction



![](img/adult/p.corr.by.spd.plot-1.png)<!-- -->

## Evaluate Coherence x Pattern interaction



![](img/adult/coh.by.pattern.plot-1.png)<!-- -->
