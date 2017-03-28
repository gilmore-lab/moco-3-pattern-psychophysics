group-analysis-children
================
Rick O. Gilmore
2017-03-28

Background
----------

This document describes the workflow involved in analyzing the motion coherence psychophysics study carried out with child participants.

Import data
-----------

Here we import the aggregate data file found in `analyses/data-aggregate/moco-beh-child.csv`, convert `AgeDays` to a categorical factor, `AgeYrs`, and compute some summary statistics across trial and block. These summary values are saved to the `df.bysub.bycond` data frame.

``` r
# Import child data, normalize

df <- read.csv(file = "analyses/data-aggregate/moco-beh-child.csv", header = TRUE)

# Convert age in days to years
df$AgeYrs <- cut(df$AgeDays/365.25, 
                 breaks = c(0,5,6,7,8,9), 
                 labels = c("<5yo", "5yo", "6yo", "7yo", "8yo"))

df %>% 
  group_by(AgeYrs, Gender, SubID, PatternType, Speed, Coh) %>% 
  summarize(N.corr = sum(Acc), 
            N.tot = n(), 
            Pct.Corr = N.corr/N.tot,
            RT.mean=mean(RT),
            RT.sd=sd(RT)) -> 
  df.bysub.bycond
```

Tabular summary of participant ages by gender
---------------------------------------------

``` r
# Summary table of age/gender dist
df.bysub.bycond %>% 
  group_by(Gender, AgeYrs, SubID) %>% 
  summarize(num = n()) -> df.gender.age
xt <- xtabs(formula = ~ AgeYrs + Gender, data = df.gender.age)
kable(xt)
```

|         |  Female|  Male|
|---------|-------:|-----:|
| &lt;5yo |       0|     0|
| 5yo     |       7|     2|
| 6yo     |       6|     2|
| 7yo     |       5|     4|
| 8yo     |       1|     2|

We tested *n*=29 children overall, (19 female) between 5 and 8 years of age.

Plot of *p*(corr) by condition
------------------------------

``` r
  # Plot theme, customizations
theme.custom <- theme(plot.title = element_text(size=16, face="bold"),
                      axis.title.x = element_text(size=14),
                      axis.title.y = element_text(size=14),
                      strip.text = element_text(size=14),
                      axis.text = element_text(size=12),
                      legend.position="bottom", 
                      legend.title=element_blank())

y_lbl <- 'p(corr)'
title_text <- 'p(corr) by Coherence, Pattern, and Speed'
df.bysub.bycond$Speed <- factor(df.bysub.bycond$Speed, labels = c("2 deg/s", "8 deg/s"))

# Plot for all subs
p <- ggplot(data=df.bysub.bycond, aes(x=Coh, y=Pct.Corr)) 
p <- p + 
  geom_line(aes(group=SubID, color=AgeYrs)) +
  facet_grid(facets = Speed ~ PatternType) +
  labs(x="Coherence", y=y_lbl) +
  ggtitle(title_text) +
  theme_bw() +
  theme.custom +
  xlim(0, 1) +
  geom_hline(yintercept=0.5, linetype="dashed")
p
```

![](group-analysis_files/figure-markdown_github/p.corr.plot-1.png)

The proportion correct responses generally increase with increasing coherence. There is a hint that younger children are less accurate.

Plot of reaction time
---------------------

``` r
# Plot RTs
y_lbl <- 'RT (s)'
title_text <- 'RT by Coherence, Pattern, and Speed'

# Plot for all subs
p <- ggplot(data=df.bysub.bycond, aes(x=Coh, y=RT.mean))
p <- p + 
  geom_line(aes(group=SubID, color=AgeYrs)) +
  facet_grid(facets = Speed ~ PatternType) +
  labs(x="Coherence", y=y_lbl) +
  ggtitle(title_text) +
  theme_bw() +
  theme.custom +
  xlim(0, 1)
p 
```

![](group-analysis_files/figure-markdown_github/rt.plot-1.png)

Reaction times generally decrease with increasing coherence. There is evidence that younger children are slower.

Plot of speed across patterns
-----------------------------

``` r
# Evaluate Speed by Coherence interaction
spd.by.coh <- df.bysub.bycond %>%
  group_by(Speed, Coh) %>%
  summarize(Pct.Corr.mean = mean(Pct.Corr, na.rm=TRUE),
            Pct.Corr.sem = sd(Pct.Corr, na.rm=TRUE)/sqrt( n() ))

limits = aes( ymax = Pct.Corr.mean + Pct.Corr.sem , ymin = Pct.Corr.mean - Pct.Corr.sem )

p4 <- 
  ggplot( data=spd.by.coh, aes(x=Coh, y=Pct.Corr.mean) ) +
  facet_grid( facets = . ~ Speed ) +
  geom_line() +
  geom_pointrange( limits ) +
  xlim(0,1) +
  ylim(.4, 1) +
  ylab("p(corr)") +
  xlab("p(coherence)") +
  theme_bw() +
  theme.custom +
  geom_hline(yintercept=0.5, linetype="dashed")
p4
```

![](group-analysis_files/figure-markdown_github/coh-by-speed-aross-pattern-1.png)

Plot of pattern across speeds
-----------------------------

``` r
patt.by.coh <- df.bysub.bycond %>%
  group_by(PatternType, Coh) %>%
  summarize(Pct.Corr.mean = mean(Pct.Corr, na.rm=TRUE),
            Pct.Corr.sem = sd(Pct.Corr, na.rm=TRUE)/sqrt( n() ))
p5 <- 
  ggplot( data=patt.by.coh, aes(x=Coh, y=Pct.Corr.mean) ) +
  facet_grid( facets = ~ PatternType ) +
  geom_line() +
  geom_pointrange( limits ) +
  xlim(0, 1) +
  ylim(.4, 1) +
  ylab("p(corr)") +
  xlab("p(coherence)") +
  theme_bw() +
  theme.custom +
  geom_hline(yintercept=0.5, linetype="dashed")
p5
```

![](group-analysis_files/figure-markdown_github/coh-by-pattern-across-speeds-1.png)

Plot of speed across patterns by age
------------------------------------

``` r
# Evaluate Speed by Coherence interaction
spd.by.coh <- df.bysub.bycond %>%
  group_by(Speed, Coh, AgeYrs) %>%
  summarize(Pct.Corr.mean = mean(Pct.Corr, na.rm=TRUE),
            Pct.Corr.sem = sd(Pct.Corr, na.rm=TRUE)/sqrt( n() ))

limits = aes( ymax = Pct.Corr.mean + Pct.Corr.sem , ymin = Pct.Corr.mean - Pct.Corr.sem )

p6 <- 
  ggplot( data=spd.by.coh, aes(x=Coh, y=Pct.Corr.mean, color = AgeYrs) ) +
  facet_grid( facets = . ~ Speed ) +
  geom_line() +
  geom_pointrange( limits ) +
  xlim(0,1) +
  ylim(.4, 1) +
  ylab("p(corr)") +
  xlab("p(coherence)") +
  theme_bw() +
  theme.custom +
  geom_hline(yintercept=0.5, linetype="dashed")
p6
```

![](group-analysis_files/figure-markdown_github/coh-by-speed-and-age-1.png)

Plot of coherence by pattern across age
---------------------------------------

``` r
patt.by.coh <- df.bysub.bycond %>%
  group_by(PatternType, Coh, AgeYrs) %>%
  summarize(Pct.Corr.mean = mean(Pct.Corr, na.rm=TRUE),
            Pct.Corr.sem = sd(Pct.Corr, na.rm=TRUE)/sqrt( n() ))
p7 <- 
  ggplot( data=patt.by.coh, aes(x=Coh, y=Pct.Corr.mean, color = AgeYrs) ) +
  facet_grid( facets = ~ PatternType ) +
  geom_line() +
  geom_pointrange( limits ) +
  xlim(0, 1) +
  ylim(.4, 1) +
  ylab("p(corr)") +
  xlab("p(coherence)") +
  theme_bw() +
  theme.custom +
  geom_hline(yintercept=0.5, linetype="dashed")
p7
```

![](group-analysis_files/figure-markdown_github/coh-by-pattern-and-age-1.png)

Histogram of age
----------------

``` r
df %>%
  group_by(AgeYrs, SubID, AgeDays) %>%
  summarize(SubAgeDays = mean(AgeDays)) %>%
  ggplot() +
  aes(x=SubAgeDays/365.25, fill = AgeYrs) + # By years?
  geom_histogram()
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](group-analysis_files/figure-markdown_github/age-histogram-1.png)

Probit analysis
---------------

### Full model

``` r
form.full <- Acc ~ AgeYrs * Coh * Speed * PatternType + (1|SubID)
mod.full <- glmer(formula = form.full, family=binomial(mafc.probit(2)), data = df)
```

    ## Warning in checkConv(attr(opt, "derivs"), opt$par, ctrl = control
    ## $checkConv, : Model failed to converge with max|grad| = 0.0164218 (tol =
    ## 0.001, component 1)

``` r
summary(mod.full)
```

    ## Generalized linear mixed model fit by maximum likelihood (Laplace
    ##   Approximation) [glmerMod]
    ##  Family: binomial  ( mafc.probit(2) )
    ## Formula: Acc ~ AgeYrs * Coh * Speed * PatternType + (1 | SubID)
    ##    Data: df
    ## 
    ##      AIC      BIC   logLik deviance df.resid 
    ##   5577.1   5812.5  -2755.5   5511.1     9247 
    ## 
    ## Scaled residuals: 
    ##     Min      1Q  Median      3Q     Max 
    ## -34.658   0.075   0.235   0.397   0.869 
    ## 
    ## Random effects:
    ##  Groups Name        Variance Std.Dev.
    ##  SubID  (Intercept) 0.0881   0.2968  
    ## Number of obs: 9280, groups:  SubID, 29
    ## 
    ## Fixed effects:
    ##                                        Estimate Std. Error z value
    ## (Intercept)                           -0.922327   0.004486  -205.6
    ## AgeYrs6yo                             -0.400286   0.004679   -85.6
    ## AgeYrs7yo                              0.702531   0.004496   156.3
    ## AgeYrs8yo                             -0.189006   0.004500   -42.0
    ## Coh                                    2.344306   0.004505   520.3
    ## Speed                                 -0.012361   0.004008    -3.1
    ## PatternTyperadial                      0.211968   0.004631    45.8
    ## AgeYrs6yo:Coh                          1.092106   0.004503   242.5
    ## AgeYrs7yo:Coh                          0.094127   0.004504    20.9
    ## AgeYrs8yo:Coh                          5.871618   0.004684  1253.7
    ## AgeYrs6yo:Speed                        0.087056   0.004419    19.7
    ## AgeYrs7yo:Speed                       -0.102329   0.004479   -22.8
    ## AgeYrs8yo:Speed                        0.127549   0.004434    28.8
    ## Coh:Speed                              0.247449   0.004395    56.3
    ## AgeYrs6yo:PatternTyperadial            0.699785   0.004644   150.7
    ## AgeYrs7yo:PatternTyperadial            0.788845   0.004676   168.7
    ## AgeYrs8yo:PatternTyperadial            2.528907   0.004501   561.9
    ## Coh:PatternTyperadial                  0.363244   0.004505    80.6
    ## Speed:PatternTyperadial                0.079135   0.004057    19.5
    ## AgeYrs6yo:Coh:Speed                   -0.222110   0.004465   -49.7
    ## AgeYrs7yo:Coh:Speed                    0.227859   0.005166    44.1
    ## AgeYrs8yo:Coh:Speed                   -0.723702   0.004495  -161.0
    ## AgeYrs6yo:Coh:PatternTyperadial       -0.267121   0.004502   -59.3
    ## AgeYrs7yo:Coh:PatternTyperadial       -3.017537   0.004502  -670.3
    ## AgeYrs8yo:Coh:PatternTyperadial       -8.467541   0.004501 -1881.1
    ## AgeYrs6yo:Speed:PatternTyperadial     -0.088168   0.004362   -20.2
    ## AgeYrs7yo:Speed:PatternTyperadial     -0.202271   0.004525   -44.7
    ## AgeYrs8yo:Speed:PatternTyperadial     -0.568916   0.004603  -123.6
    ## Coh:Speed:PatternTyperadial           -0.240659   0.004587   -52.5
    ## AgeYrs6yo:Coh:Speed:PatternTyperadial  0.227912   0.004489    50.8
    ## AgeYrs7yo:Coh:Speed:PatternTyperadial  1.260032   0.004679   269.3
    ## AgeYrs8yo:Coh:Speed:PatternTyperadial  2.061018   0.004500   458.0
    ##                                       Pr(>|z|)    
    ## (Intercept)                            < 2e-16 ***
    ## AgeYrs6yo                              < 2e-16 ***
    ## AgeYrs7yo                              < 2e-16 ***
    ## AgeYrs8yo                              < 2e-16 ***
    ## Coh                                    < 2e-16 ***
    ## Speed                                  0.00204 ** 
    ## PatternTyperadial                      < 2e-16 ***
    ## AgeYrs6yo:Coh                          < 2e-16 ***
    ## AgeYrs7yo:Coh                          < 2e-16 ***
    ## AgeYrs8yo:Coh                          < 2e-16 ***
    ## AgeYrs6yo:Speed                        < 2e-16 ***
    ## AgeYrs7yo:Speed                        < 2e-16 ***
    ## AgeYrs8yo:Speed                        < 2e-16 ***
    ## Coh:Speed                              < 2e-16 ***
    ## AgeYrs6yo:PatternTyperadial            < 2e-16 ***
    ## AgeYrs7yo:PatternTyperadial            < 2e-16 ***
    ## AgeYrs8yo:PatternTyperadial            < 2e-16 ***
    ## Coh:PatternTyperadial                  < 2e-16 ***
    ## Speed:PatternTyperadial                < 2e-16 ***
    ## AgeYrs6yo:Coh:Speed                    < 2e-16 ***
    ## AgeYrs7yo:Coh:Speed                    < 2e-16 ***
    ## AgeYrs8yo:Coh:Speed                    < 2e-16 ***
    ## AgeYrs6yo:Coh:PatternTyperadial        < 2e-16 ***
    ## AgeYrs7yo:Coh:PatternTyperadial        < 2e-16 ***
    ## AgeYrs8yo:Coh:PatternTyperadial        < 2e-16 ***
    ## AgeYrs6yo:Speed:PatternTyperadial      < 2e-16 ***
    ## AgeYrs7yo:Speed:PatternTyperadial      < 2e-16 ***
    ## AgeYrs8yo:Speed:PatternTyperadial      < 2e-16 ***
    ## Coh:Speed:PatternTyperadial            < 2e-16 ***
    ## AgeYrs6yo:Coh:Speed:PatternTyperadial  < 2e-16 ***
    ## AgeYrs7yo:Coh:Speed:PatternTyperadial  < 2e-16 ***
    ## AgeYrs8yo:Coh:Speed:PatternTyperadial  < 2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

    ## 
    ## Correlation matrix not shown by default, as p = 32 > 12.
    ## Use print(x, correlation=TRUE)  or
    ##   vcov(x)     if you need it

    ## convergence code: 0
    ## Model failed to converge with max|grad| = 0.0164218 (tol = 0.001, component 1)
