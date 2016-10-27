render_all <- function(plot_hires = FALSE, output_form='html_document') {
  # Renders all .Rmd files
  
  # Change dpi, plot_dev, and plot_titles depending on plot resolution
  if (plot_hires){
    dpi = 300
    plot_dev = 'quartz_tiff'
    plot_titles = FALSE
  } else {
    dpi = 72
    plot_dev = 'png'
    plot_titles = FALSE
  }
  
  # Create moco_render function
  moco_beh_render <- function(fn="moco-behavior-report.Rmd", group="child", out_form=output_form) {
    rmarkdown::render(fn,
                      output_format = out_form,
                      output_file=paste('html/', paste(group, 'html', sep="."), sep=''),
                      params=list(group=group, 
                                  dpi=dpi, 
                                  plot_dev=plot_dev,
                                  plot_titles = plot_titles)
    )
  }
  
  # Apply it to child and adult groups
  mapply(moco_beh_render, fn=list("moco-behavior-report.Rmd"), group=list("child", "adult"))

  # Generate model reports
  rmarkdown::render("model-fitting-children.Rmd", output_file = "html/child.models.html")
  rmarkdown::render("model-fitting-adults.Rmd", output_file = "html/adult.models.html")
  
}
