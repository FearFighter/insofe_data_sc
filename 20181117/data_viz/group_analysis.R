setwd("~/Dropbox/insofe/data_viz")

library(tidyverse)


# The following dataset contains weight loss experienced by folks who tried three types of diets.
# Analyse which type of diet is the best for weight loss, also find the average weight loss.

"diet_weightloss.csv" %>% 
  read_csv() -> raw_weight_loss_data

raw_weight_loss_data %>% 
  group_by(diet) %>% 
  summarise(mean_weight_loss = weightloss %>% mean()) -> mean_weight_loss_by_diet


ggplot() +
  geom_jitter(data = raw_weight_loss_data,
             aes(x = diet,
                 y = weightloss,
                 color = diet),
             position = position_jitter(width = 0.1, height = 0),
             size = 10,
             alpha = 0.5) +
  geom_label(data = mean_weight_loss_by_diet,
             aes(x = diet,
                 y = mean_weight_loss,
                 color = diet,
                 label = mean_weight_loss %>% round(2)),
             size = 15,
             alpha = 0.5,
             nudge_x = 0.3,
             show.legend = FALSE) +
  labs(title = "Diet Experiment",
       x = "Diet Type",
       y = "Weight Lost (in kgs)",
       color = "Diet") +
  theme_minimal()
