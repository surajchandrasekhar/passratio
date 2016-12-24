library(dplyr)
per <- read.csv("./data/2017pergame.csv")
per$useless<- NULL
total <- read.csv("./data/2017total.csv")
total$useless <- NULL
advanced <- read.csv("./data/2017advanced.csv")
tracker <- read.csv("./data/nba_com_player_stats.csv")
advanced$useless <- NULL
join1<- per %>% left_join(total, by=c("Player","Tm"))
full <- join1 %>% left_join(advanced, by=c("Player","Tm"))
total <- full %>% left_join(tracker, by=c("Player","Tm"))
total$usless <- NULL
total$PSR <- (total$PassesMade + total$PotentialAst + total$SecondaryAst)/(total$tFGA + 0.44*total$tFTA + total$tTOV)
total$PSR <- signif(total$PSR, digits= 3)
total <- total %>% filter(G > 15)
total <- total %>% filter((Min/G) > 20)
write.csv(total, file="./data/2017playerdata.csv")
