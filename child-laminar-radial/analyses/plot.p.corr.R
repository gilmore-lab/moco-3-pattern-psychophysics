plot.p.corr <- function(df){
  # Plots p(correct) by condition

  # Plot theme
  theme.moco.plot <- theme(plot.title = element_text(size=18, face="bold"),
                           axis.title.x = element_text(size=18),
                           axis.title.y = element_text(size=18),
                           strip.text = element_text(size=16),
                           axis.text = element_text(size=12)
  )
  
  y_lbl <- 'p(corr)'
  title_text <- 'p(corr) by Coherence, Pattern, and Speed'
  p <- ggplot(data=df, aes(x=Coh, y=N.corr/N.tot)) 
  
  # Plot for all subs
  p <- p + 
    #geom_point(alpha=.2) + 
    geom_line(aes(group=SubID)) +
    # geom_smooth(aes(group=as.factor(SubID))) +
    #geom_smooth(aes(group=1), size=2, color="white") +
    # geom_smooth(aes(color=as.factor(SubID), 
    #                 group=as.factor(SubID)), 
    #             linetype="dashed", 
    #             method="lm", 
    #             formula=y~poly(x,2), se=F) +
    # geom_smooth(aes(group=1), 
    #             method="lm", 
    #             size=2, 
    #             color="white", 
    #             formula = y ~ poly(x,2), se=T) +
    facet_grid(facets = Speed ~ PatternType) +
    labs(x="Coherence", y=y_lbl) +
    guides(color = FALSE) + # suppress legend
    theme.moco.plot + 
    ggtitle(title_text) +
    xlim(0, 1) +
    ylim(.3,1.1)
  
  p    
}
