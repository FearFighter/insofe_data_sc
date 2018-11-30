# datasaurous
library(datasauRus)
library(tidyverse)
setwd("~/Dropbox/insofe/data_viz")
library(datasauRus)
datasaurus_dozen %>%
  View()

datasaurus_dozen %>%
  ggplot(aes(x=x, y=y, colour=dataset))+
  geom_point()+
  theme_grey()+
  theme(legend.position = "none") +
  facet_wrap(~dataset, ncol=3)

datasaurus_dozen %>%
  filter(dataset %in% c("dino","dots")) %>% 
  group_by(dataset) %>%
  mutate(meanx = mean(x), 
         meany = mean(y), 
         sdx = sd(x), 
         sdy = sd(y), 
         corr = cor(y,x)) %>% 
  ggplot(aes(x=x, y=y, colour=dataset))+
  geom_point()+
  geom_label(x = 60, y = 102, size = 5, aes(label = paste(meanx %>% round(2),
                                                         meany %>% round(2),
                                                         sdx %>% round(2),
                                                         sdy %>% round(2),
                                                         corr %>% round(2), sep = "/"))) +
  theme_grey() +
  theme(legend.position = "none")+
  facet_wrap(~dataset, ncol=3) + 
  ggsave("datasauRus.pdf", width = 8, height = 8, unit = "in")

