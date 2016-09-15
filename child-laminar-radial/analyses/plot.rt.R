plot.rt <- function(df){
  theme.moco.plot <- theme(plot.title = element_text(size=18, face="bold"),
                           axis.title.x = element_text(size=18),
                           axis.title.y = element_text(size=18),
                           strip.text = element_text(size=16),
                           axis.text = element_text(size=14)
  )
  
  y_lbl <- 'RT (s)'
  title_text <- 'RT by Coherence, Pattern, and Speed'
  p <- ggplot(data=df, aes(x=as.factor(Coh), y=RT.mean))
  
  # Plot for all subs
  p <- p + 
    geom_point(aes(color=as.factor(SubID))) + 
    geom_smooth(aes(color=as.factor(SubID), 
                    group=as.factor(SubID)), 
                linetype="dashed", 
                method="lm", 
                formula=y~poly(x,2), se=F) +
    geom_smooth(aes(group=1), 
                method="lm", 
                size=2, 
                color="white", 
                formula = y ~ poly(x,2)) +
    facet_grid(facets = Speed ~ PatternType) +
    labs(x="Coherence", y=y_lbl) +
    guides(color = FALSE) + # suppress legend
    theme.moco.plot + 
    ggtitle(title_text)
  
  p    
  
}
