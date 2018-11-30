# Data Tidying

rm(list = ls())
setwd("~/Dropbox/insofe/data_viz")

library(tidyverse)
library(janitor)

# Which state had the most number of primary schools as of 2010 ?
"Number_of_Schools-Primary_and_Upper_primary_School.csv" %>% 
  read_csv() %>% 
  clean_names() %>% 
  filter(india_state_uts != "India") %>% 
  rename(state = india_state_uts) %>% 
  gather(c(3:12),key = year,value=school_count) %>% 
  separate(year, into = c("x","year"), sep = 1, convert = TRUE) %>% 
  select(-x) %>% 
  filter(year == 2010 & school_type == "Primary School") %>% 
  arrange(desc(school_count)) %>%
  head(n = 1)



"Number_of_Schools-Primary_and_Upper_primary_School.csv" %>%
  read_csv() %>% 
  clean_names() %>%
  gather(-c(1:2),key = year,value=school_count) %>% 
  separate(year, into = c("x","year"), sep = 1, convert = TRUE) %>% 
  select(-x) %>% 
  filter(year == 2010 & school_type == "Primary School") %>%
  filter(india_state_uts != "India") %>%
  ggplot(aes(x = india_state_uts, y = school_count )) + 
  geom_point() +  
  coord_flip() +
  labs(title = "Primary school count in 2010",
       x = "Count",
       y  = "State / Union Territory",
       subtitle = "From data.gov.in",
       caption = "Gujarat is missing")

"Number_of_Schools-Primary_and_Upper_primary_School.csv" %>% 
  read_csv() %>% 
  clean_names() %>%
  gather(-c(1:2),key = year,value=school_count) %>% 
  separate(year, into = c("x","year"), sep = 1, convert = TRUE) %>% 
  select(-x) %>% 
  filter(year == 2010 & school_type == "Primary School") %>%
  filter(india_state_uts != "India") %>%
  ggplot(aes(x = india_state_uts, y = school_count )) + 
  geom_col() +  
  coord_flip() +
  labs(title = "Primary school count in 2010",
       x = "Count",
       y  = "State / Union Territory",
       subtitle = "From data.gov.in",
       caption = "Gujarat is missing")

"Number_of_Schools-Primary_and_Upper_primary_School.csv" %>% 
  read_csv() %>% 
  clean_names() %>%
  gather(-c(1:2),key = year,value=school_count) %>% 
  separate(year, into = c("x","year"), sep = 1, convert = TRUE) %>% 
  select(-x) %>% 
  filter(year == 2010 & school_type == "Primary School") %>%
  filter(india_state_uts != "India") %>%
  ggplot(aes(x = reorder(india_state_uts,school_count), y = school_count )) + 
  geom_col() +  
  coord_flip() +
  labs(title = "Primary school count in 2010",
       x = "Count",
       y  = "State / Union Territory",
       subtitle = "From data.gov.in",
       caption = "Gujarat is missing")


"Number_of_Schools-Primary_and_Upper_primary_School.csv" %>% 
  read_csv() %>% 
  clean_names() %>%
  gather(-c(1:2),key = year,value=school_count) %>% 
  separate(year, into = c("x","year"), sep = 1, convert = TRUE) %>% 
  select(-x) %>% 
  filter(year == 2010 & school_type == "Primary School") %>%
  filter(india_state_uts != "India") %>%
  drop_na() %>% 
  ggplot(aes(x = reorder(india_state_uts,school_count), y = school_count)) + 
  geom_col() +  
  coord_flip() +
  labs(title = "Primary school count in 2010",
       x = "Count",
       y  = "State / Union Territory",
       subtitle = "From data.gov.in",
       caption = "Gujarat is missing")

