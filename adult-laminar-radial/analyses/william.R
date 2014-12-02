# william.R
#
# William's analysis commands

# History
# 2014-11-17 initial version

# import session, illustrative example shown
sess = read.csv("../data/2014-11-11-004/2014-11-11-004-combined.csv") 

# Create new aggregate file
source('bulk.import.convert.sessions.R')
bulk.import.convert.sessions()

#import aggregate
agg=read.csv("../aggregate-data/adult-laminar-radial-grouped.csv")

# load plotting library 
library( ggplot2 )
library( dplyr )

df1 <- agg %>%
  group_by( ParticipantID, PatternType, DegPSec, Coh ) %>%
  summarise( p.corr=sum( Acc == TRUE )/n() ) 

qplot( data=df1, x=Coh, 
       y=p.corr, 
       facets = PatternType ~ DegPSec, 
       group=ParticipantID, 
       geom=c("point", "smooth"), 
       color=as.factor(ParticipantID) )

# plot RTs
qplot( x=as.factor(Coh), y=RT, facets = DegPSec ~ PatternType,geom="boxplot", data=sess )

# Source p.corr... commmand
source('~/Box Sync/gilmore-lab/projects/optic-flow/optic-flow-psychophysics/projects/moco-3-pattern-psychophysics/adult-laminar-radial/analyses/calculate.p.corr.R')

# calculate and plot p correct
sess.p.corr.df = calculate.p.corr( sess )

# plot
qplot( x=as.factor(Coh), y=Pcorr, data=sess.p.corr.df, facets = DegPSec ~ PatternType, shape=as.factor(Run) )