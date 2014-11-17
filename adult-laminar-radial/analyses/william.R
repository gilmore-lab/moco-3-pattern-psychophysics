# william.R
#
# William's analysis commands

# History
# 2014-11-17 initial version

# import session, illustrative example shown
sess = read.csv("../data/2014-11-11-004/2014-11-11-004-combined.csv") 

# load plotting library 
library( ggplot2 )

# plot RTs
qplot( x=as.factor(Coh), y=RT, facets = DegPSec ~ PatternType,geom="boxplot", data=sess )

# Source p.corr... commmand
source('~/Box Sync/gilmore-lab/projects/optic-flow/optic-flow-psychophysics/projects/moco-3-pattern-psychophysics/adult-laminar-radial/analyses/calculate.p.corr.R')

# calculate and plot p correct
sess.p.corr.df = calculate.p.corr( sess )

# plot
qplot( x=as.factor(Coh), y=Pcorr, data=sess.p.corr.df, facets = DegPSec ~ PatternType, shape=as.factor(Run) )