# Modal analysis via data visualizations
setwd("~/Dropbox/insofe/data_viz")
library(tidyverse)
# devtools::install_github("ropensci/visdat")
library(visdat)
library(lubridate)

# openaq.csv is an actual data from openaq.org
"openaq.csv" %>% 
  read_csv() %>%  
  select(c("location","city","local","parameter","value","unit")) %>% 
  filter(city %in% c("Bengaluru", "Chennai", "Mumbai", "Kolkata")) %>% 
  mutate(year = local %>% year()) %>% 
  mutate(month = local %>% month()) %>% 
  mutate(day = local %>% day()) %>% 
  mutate(hour = local %>% hour()) %>% 
  mutate(minute = local %>% minute()) %>% #pull(day) %>% unique()
  filter(day == 26) %>% # == is equality condition check
  group_by(city, parameter) %>% 
  summarise(avg_value = value %>% mean() %>% round(1)) %>% 
  ggplot(aes(x = city,
             y = avg_value,
             fill = city)) +
  geom_col() + 
  coord_flip() + 
  facet_wrap(~ parameter, scales = "free", ncol = 2) + 
  theme_minimal()

# find pm25 < 0 in the raw data 
"openaq.csv" %>% 
  read_csv() %>% # View("airquality data")
  select(c("location","city","local","parameter","value","unit")) %>% 
  filter(city %in% c("Bengaluru", "Chennai", "Mumbai", "Kolkata")) %>% 
  filter(parameter == "pm25") %>% 
  filter(value <= 0) %>% View()

# Strategy 1 : Filter and move on

"openaq.csv" %>% 
  read_csv() %>% # View("airquality data")
  select(c("location","city","local","parameter","value","unit")) %>% 
  filter(city %in% c("Bengaluru", "Chennai", "Mumbai", "Kolkata")) %>% 
  mutate(year = local %>% year()) %>% 
  mutate(month = local %>% month()) %>% 
  mutate(day = local %>% day()) %>% 
  mutate(hour = local %>% hour()) %>% 
  mutate(minute = local %>% minute()) %>% #pull(day) %>% unique()
  filter(day == 26) %>%  # == is equality condition check
  filter(value > 0) %>% 
  group_by(city, parameter) %>% 
  summarise(avg_value = value %>% mean() %>% round(1)) %>% 
  ggplot(aes(x = city,
             y = avg_value,
             fill = city)) +
  geom_col() + 
  coord_flip() + 
  facet_wrap(~ parameter, scales = "free", ncol = 2) + 
  theme_minimal()

# Strategy 2
"openaq.csv" %>% 
  read_csv() %>% # View("airquality data")
  select(c("location","city","local","parameter","value","unit")) %>% 
  filter(city %in% c("Bengaluru", "Chennai", "Mumbai", "Kolkata")) %>% 
  mutate(year = local %>% year()) %>% 
  mutate(month = local %>% month()) %>% 
  mutate(day = local %>% day()) %>% 
  mutate(hour = local %>% hour()) %>% 
  mutate(minute = local %>% minute()) %>% #pull(day) %>% unique()
  filter(day == 26) %>%  # == is equality condition check
  #mutate(value = ifelse(value < 0, NA, value)) %>% vis_dat()
  mutate(value = ifelse(value < 0, NA, value)) %>% #vis_miss()
  drop_na() %>% #vis_dat()
  group_by(city, parameter) %>% 
  summarise(avg_value = value %>% mean() %>% round(1)) %>% 
  ggplot(aes(x = city,
             y = avg_value,
             fill = city)) +
  geom_col() + 
  coord_flip() + 
  facet_wrap(~ parameter, scales = "free", ncol = 2) + 
  theme_minimal()


# Strategy : use geom_density

"openaq.csv" %>% 
  read_csv() %>% 
  filter(city %in% c("Chennai","Mumbai","Kolkata","Bengaluru")) %>% 
  ggplot(aes(x = value)) + 
  geom_density() 


"openaq.csv" %>% 
  read_csv() %>% 
  filter(city %in% c("Chennai","Mumbai","Kolkata","Bengaluru")) %>% 
  ggplot(aes(x = value)) + 
  geom_density()  + 
  facet_wrap(~ city, scales = "free")

"openaq.csv" %>% 
  read_csv() %>% 
  filter(city %in% c("Chennai","Mumbai","Kolkata","Bengaluru")) %>% 
  ggplot(aes(x = value)) + 
  geom_density() + 
  facet_wrap(~ city + parameter, scales = "free", ncol = 6)

"openaq.csv" %>% 
  read_csv() %>% 
  filter(city %in% c("Chennai","Mumbai","Kolkata","Bengaluru")) %>% 
  ggplot(aes(x = value)) + 
  geom_density() + 
  facet_wrap(~ parameter + city, scales = "free", nrow  = 6)

"openaq.csv" %>% 
  read_csv() %>% 
  filter(city %in% c("Chennai","Mumbai","Kolkata","Bengaluru")) %>% 
  filter(value > 0 & value < 1000) %>% 
  ggplot(aes(x = value)) + 
  geom_density() + 
  facet_wrap(~ parameter + city, scales = "free", nrow  = 6)

"openaq.csv" %>% 
  read_csv() %>% 
  filter(city %in% c("Chennai","Mumbai","Kolkata","Bengaluru")) %>% 
  filter(value > 0 & value < 1000) %>% 
  ggplot(aes(x = value)) + 
  geom_density() + 
  facet_wrap(~ parameter + city, scales = "free", nrow  = 6)

