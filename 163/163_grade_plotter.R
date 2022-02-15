library(ggplot2)
library(ggthemes)
library(showtext) # Uses OTF files.
#library(extrafont)


# Registers ttf fonts for use with PDF output (ggsave), 
# enables them to be saved in PDF file (embed_fonts).
#loadfonts() 

#Change exam name and numbers for each grade.
# Number is order from A to F.
exam_name <- "exam3_f21.pdf"
Number <- c(5,11,7,6,7)

Grade <- c("A","B","C","D","F")
df <- data.frame(Grade, Number)

# Load the extra fonts so they will be recognized for use.
#loadfonts(device = "pdf")

# Build plot
font_add(family = "Linux Biolinum", regular = "/Library/fonts/LinBiolinum_R.otf")
showtext_auto()

grade_plot <- ggplot(df, aes(Grade,Number)) + 
  geom_col(fill = "#2171B5", # Fill color is Blue6 from Beamer lectures
           width=0.7) + 
  theme_tufte() + 
  scale_x_discrete(limits = sort(Grade, 
                                 decreasing = TRUE)) + 
  labs(x = "", 
       y = "") + 
  scale_y_continuous(breaks=seq(0,40,5)) +
  theme(axis.ticks = element_blank(), 
        axis.ticks.length = unit(0, "mm"),
#        text=element_text(size=16),
        text=element_text(size=16,  family="Linux Biolinum"),
        axis.text.x = element_text(margin = margin(b = 10))) +
  coord_flip() 

# Obtain the location of the x.major source grid lines. See
# https://stackoverflow.com/questions/31223818/accessing-vector-of-axis-ticks-for-an-existing-plot-in-ggplot2
# But note modified format below to fit with newer ggplot2 structure
# Because the graph is flipped, use x.major_source instead of y.major_source
# y_intercept <- ggplot_build(grade_plot)$layout$panel_ranges[[1]]$x.major_source # No longer works.
# See update.

# Updated Sep 2021 for ggplot2 version 3.x
# y_intercept <- ggplot_build(grade_plot)$layout$coord$labels(ggplot_build(grade_plot)$layout$panel_params)[[1]]$x.major_source
y_intercept <- ggplot_build(grade_plot)$layout$panel_params[[1]]$x.sec$breaks

grade_plot <- grade_plot + geom_hline(yintercept = na.omit(y_intercept), color="white", size =  0.25)

# Save the PDf file.
ggsave(exam_name, plot=grade_plot, width=4.5, height=3)

# Embed the Linux Biolinum font.
# Not needed when using showtext package.
#embed_fonts(exam_name)

