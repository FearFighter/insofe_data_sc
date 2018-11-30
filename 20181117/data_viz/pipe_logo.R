setwd("~/Dropbox/insofe/data_viz")
library(tidyverse)

df <- data_frame(x = seq(-pi/2,pi/2,by = 0.01), y = atan(x))
ggplot()+
  geom_text(label = "%   %",aes(x = 0, y = 0,color = "#00A2FF"), size = 100) +
  scale_color_manual(values = "#00A2FF") +
  theme_void() +
  geom_line(data = df, aes(x, y),size = 8,color = "#00A2FF") +
  theme(legend.position = "none",
        plot.background = element_rect(fill = "darkblue")) -> p1

"sirpi.logo.percent.atan.percent.dark_blue_background.pdf" %>% ggsave(p1, width = 11, height = 11, unit = "in")
"sirpi.logo.percent.atan.percent.dark_blue_background.png" %>% ggsave(p1, width = 11, height = 11, unit = "in")
