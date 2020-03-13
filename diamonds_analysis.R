data_diamonds <- read.csv("data_diamonds_complete.csv")
data_diamonds_clarity_levels <- unique(data_diamonds$clarity)
data_diamonds$clarity <- match(data_diamonds$clarity, data_diamonds_clarity_levels)

data_diamonds_cut_levels <- unique(data_diamonds$cut)
data_diamonds$cut <- match(data_diamonds$cut, data_diamonds_cut_levels)

data_diamonds_color_levels <- unique(data_diamonds$color)
data_diamonds$color <- match(data_diamonds$color, data_diamonds_color_levels)

write.csv(data_diamonds, "data_diamonds_complete.csv")

