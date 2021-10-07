#prove that more "rebound_chances"
#means more "goals"
setwd("C:/Users/zman_/Downloads")
library(tidyverse)
data <- read_csv("Clean PWHPA Secret Dream Gap Tour - SportLogiq - PWHPA Secret Dream Gap Tour.csv")


colors <- read_csv("PWHPA Team Colors.csv")

data <- merge(data, colors, by = "team")

library(ggplot2)

boxplot <- ggplot(data,
                  aes(y = pct_of_play_in_oz,
                      x = result)) +
  geom_boxplot()

boxplot

violin_plot <- ggplot (data,
        aes(y = pct_of_play_in_oz,
            x = result,
            fill = primary,
            color = secondary)) +
  geom_violin() +
  scale_fill_identity() +
  scale_color_identity() +
  facet_wrap(~team)

violin_plot + 
  labs(title = "Contribution of Offensive Time to Result",
       subtitle = "How the Amount of in Posession in the Offensive Zone Contributes to the Outcome of the Game",
       caption = "Data Viz by Perry Berlin & Zach Kifer | Data from PWHPA and Sportlogiq",
       x = "Result",
       y = "Possesion Time in Offensive Zone")
