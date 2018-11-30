library(tidygraph)
library(ggraph)
library(tidyverse)
setwd("~/Dropbox/insofe/data_viz")

# tidy framework for networks, graphs, trees

# network = nodes + edges

# tidy graph = tidy dataframe for nodes + tidy dataframe for edges

# devtools::install_github('thomasp85/ggraph')


tribble(~ from, ~ to, ~ year,
        "India", "USA", "2000",
        "USA", "Canada", "2000",
        "USA", "Switzerland", "2005",
        "Switzerland", "India", "2005",
        "India", "Japan", "2010",
        "USA", "China", "2010",
        "India","Malaysia","2010") %>% 
  as_tbl_graph() %>% 
  ggraph() +
  geom_edge_link(aes(colour = year),arrow = arrow()) +
  geom_node_point(size = 10, alpha = 0.2) +
  geom_node_text(aes(label = name)) +
  theme_graph() 



tribble(~ from, ~ to, ~ year,
        "India", "USA", "2000",
        "USA", "Canada", "2000",
        "USA", "Switzerland", "2005",
        "Switzerland", "India", "2005",
        "India", "Japan", "2010",
        "USA", "China", "2010",
        "India","Malaysia","2010") -> A

tribble(~ from, ~ to, ~ year,
        "India", "Canada", "2000",
        "USA", "Canada", "2000",
        "USA", "India", "2005",
        "Switzerland", "India", "2005",
        "India", "China", "2010",
        "USA", "China", "2010",
        "China","Malaysia","2010") -> B

A %>% 
  mutate(traveller = "A") %>% 
  as_tbl_graph() %>% 
  mutate(name = name) -> Agraph

B %>% 
  mutate(traveller = "B") %>% 
  as_tbl_graph() %>% 
  mutate(name = name) -> Bgraph

# Whats countries
Agraph %>% 
  graph_join(Bgraph) %>% 
  ggraph() +
  geom_node_point(size = 10, alpha = 0.2) +
  geom_node_text(aes(label = name)) +
  theme_graph()


# Whats trips were made
Agraph %>% 
  graph_join(Bgraph) %>% 
  ggraph() +
  geom_edge_arc(arrow = arrow()) +
  geom_node_point(size = 10, alpha = 0.2) +
  geom_node_text(aes(label = name)) +
  theme_graph() 



# Highlight countries 
Agraph %>% 
  graph_join(Bgraph) %>% 
  ggraph() +
  geom_edge_arc(alpha = 0.1) +
  geom_node_point(size = 10, alpha = 0.2, aes(colour = name)) +
  geom_node_text(aes(label = name)) +
  theme_graph() 

# Who made and when ?
Agraph %>% 
  graph_join(Bgraph) %>% 
  ggraph() +
  geom_edge_arc(aes(colour = year,linetype = traveller),arrow = arrow()) +
  geom_node_point(size = 10, alpha = 0.2) +
  geom_node_text(aes(label = name)) +
  theme_graph() 

# Reveals that USA -> Canada in 2000 is by both travellers
Agraph %>% 
  graph_join(Bgraph) %>% 
  ggraph() +
  geom_edge_arc(aes(colour = year,linetype = traveller),arrow = arrow()) +
  geom_node_point(size = 10, alpha = 0.2) +
  geom_node_text(aes(label = name), size = 2) +
  theme_graph() +
  facet_grid(~ traveller)


# Full picture
Agraph %>% 
  graph_join(Bgraph) %>% 
  ggraph() +
  geom_edge_arc(aes(colour = year,linetype = traveller),arrow = arrow()) +
  geom_node_point(size = 10, alpha = 0.2) +
  geom_node_text(aes(label = name), size = 2) +
  theme_graph(foreground = "grey") +
  facet_grid(year ~ traveller)

# Filters
Agraph %>% 
  graph_join(Bgraph) %>% 
  filter(name != "India") %>% 
  ggraph() +
  geom_edge_arc(aes(colour = year,linetype = traveller),arrow = arrow()) +
  geom_node_point(size = 10, alpha = 0.2) +
  geom_node_text(aes(label = name), size = 2) +
  theme_graph(foreground = "grey") +
  facet_grid(year ~ traveller)


# What trips were made
# Sometimes - we dont get clear indication. Was there a trip  China->USA or USA->China
Agraph %>% 
  graph_join(Bgraph) %>% 
  ggraph(layout = "linear") +
  geom_edge_arc(arrow = arrow()) +
  geom_node_point(size = 10, alpha = 0.2) +
  geom_node_text(aes(label = name)) +
  theme_graph() 

# Finer customizations
Agraph %>% 
  graph_join(Bgraph) %>% 
  ggraph(layout = "linear", circular = TRUE) +
  geom_edge_link(arrow = arrow(length = unit(5,"mm")),
                 end_cap = circle(10, 'mm'),
                 start_cap = circle(10, 'mm'),
                 width = 1.5,
                 alpha = 0.8,
                 aes(colour = year, linetype = traveller)) +
  geom_node_point(size = 20, alpha = 0.2, colour = "lightblue") +
  geom_node_label(aes(label = name),colour = "darkgreen") +
  theme_graph() +
  scale_edge_colour_manual(values = c("pink", "magenta","darkblue"))

