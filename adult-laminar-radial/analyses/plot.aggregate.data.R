# plot.aggregate.data.R
#
# Load and plot P.corr and RT data
#
# Libraries: ggplot2, dplyr

# History
# 2014-11-18 rogilmore wrote

# load libraries
library(ggplot2)
library(dplyr)
library(nlme)

# load dataset
moco <- read.csv("../aggregate-data/adult-laminar-radial-grouped.csv")

# fix dataframe
moco$SessionDate = as.Date( moco$SessionDate )
moco$DegPSec = ordered( moco$DegPSec )
moco$Acc = as.logical( moco$Acc )

# convert to dplyr table
moco.tbl <- tbl_df( moco )

# Compute and plot proportion correct by pattern and speed
p.corr.tbl <- moco.tbl %>%
  group_by( ParticipantID, DegPSec, PatternType, Coh ) %>%
  summarise( P.Corr=mean( Acc ) ) %>%
  filter( !is.na(P.Corr) )

pl <- ggplot(data=p.corr.tbl) + 
  facet_grid( facets = DegPSec ~ PatternType )

pl.p.corr <- pl +
  geom_boxplot( aes(x=ordered(Coh), y=P.Corr) )

# Compute and plot RT for correct responses
rt.tbl <- moco.tbl %>%
  filter( Acc==TRUE ) %>%
  group_by( ParticipantID, DegPSec, PatternType, Coh )

pl.rt <- pl %+% rt.tbl +
  geom_boxplot( aes(x=ordered(Coh), y=RT) )

# Simple mixed linear modeling
p.corr.lme <- lme( P.Corr ~ Coh*PatternType*DegPSec, 
                   random = ~ 1 | ParticipantID, 
                   data=p.corr.tbl )

anova( p.corr.lme )

# Investigate PatternType x Coh Interaction
p.corr.tbl %>%
  group_by(PatternType, Coh) %>%
  summarise( P.Corr.mean=mean(P.Corr))

# RT model
r.lme <- lme( RT ~ ordered(Coh)*PatternType*DegPSec, 
              random = ~ 1 | ParticipantID, 
              data=rt.tbl )

anova( r.lme )

# Investigate Speed X Coh interaction
rt.tbl %>% 
  group_by(DegPSec, Coh ) %>%
  summarise( RT.mean=mean(RT, na.rm=TRUE) )

