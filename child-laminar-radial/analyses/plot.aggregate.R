# plot.aggregate.R
# Script to make several plots based on the aggregate data.

# libraries
library(dplyr, ggplot2)

# load data
df <- read.csv(file = "analyses/data-aggregate/moco-beh-child.csv", header = TRUE)

# Source functions
fn.list <- list("analyses/summarize.bysub.bycond.R", 
                "analyses/plot.p.corr.R", 
                "analyses/plot.rt.R",
                "analyses/plot.p.corr.by.age.yrs.R")
lapply(fn.list, source, echo = FALSE, print.eval = FALSE)

# summarize across participants, conditions
df.bysub.bycond <- summarize.bysub.bycond(df)

# Plot p(corr)
p1 <- plot.p.corr(df.bysub.bycond)
ggsave(plot = p1, filename = "analyses/img/p.corr.pdf")

# Plot RTs
p2 <- plot.rt(df.bysub.bycond)
ggsave(plot = p2, filename = "analyses/img/rt.pdf")

# Plot p(corr) by age
p3 <- plot.p.corr.by.age.yrs(df.bysub.bycond)
ggsave(plot = p3, filename = "analyses/img/p.corr.by.age.yrs.pdf")
