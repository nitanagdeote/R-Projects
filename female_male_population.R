# female vs male population India
year <- c(1951, 2011)
male <- c(185528462,623724248)
female <-c(175559628,  586469174)
population <- data.frame(year = year, male=male,female=female)
p<- ggplot(population, aes(year,male, fill= year))+ geom_bar(stat= "identity", width=6)
p+coord_cartesian(xlim = c(1950,2011))
#----------------------------------------------
population_1 <- population
m1 <- melt(population_1, id = "year")
plot1<- ggplot(m1, aes(year,value, fill= variable))+ geom_bar(stat= "identity", width=6, ,position = "dodge")
plot1 + coord_cartesian(xlim = c(1940,2011))
plot1 + labs(title = "male and female population")+ xlab("year")+ ylab("population")

