library(dplyr)
per <- read.csv("./data/2017pergame.csv")
per$useless<- NULL
total <- read.csv("./data/2017total.csv")
total$useless <- NULL
advanced <- read.csv("./data/2017advanced.csv")
advanced$useless <- NULL
join1<- per %>% left_join(total, by=c("Player","Tm"))
full <- join1 %>% left_join(advanced, by=c("Player","Tm"))
full <- full %>% arrange(desc(AST))
players <- head(full, n=25)
passes <- c(2001,1757,1525,2011,1469,1633,1839,1617,1726,1728,1470,1533,1350,910,1794,1566,1506,1911,306,1543,1466,1639,1197,1289,1226)
potential <- c(648,356,474,507,415,350,421,320,457,372,305,324,263,202,356,363,310,375,77,324,289,324,257,280,273)
secondary <- c(51,35,39,44,32,39,35,26,45,40,39,31,26,15,34,49,40,50,3,71,27,27,38,27,33)
players$passes <- passes
players$potential <- potential
players$secondary <- secondary
players$usless <- NULL
players$PSR <- (players$passes + players$potential + players$secondary)/(players$tFGA + 0.5*players$tFTA + players$tTOV)
players$PSR <- signif(players$PSR, digits= 3)
players$psr <- NULL
write.csv(players, file="./data/2017playerdata.csv")
