# Analysis of rape data in India, Year 2000.  
 crim_In_2000_Table_28_III <- read.csv("~/Downloads/crim_In_2000_Table_28_III.csv")
View(crim_In_2000_Table_28_III)
   crime <- crim_In_2000_Table_28_III
   
   crimeState <- crime[1:25,]
   myCrimeData <- crimeState[1:5,1:3]
   library("ggplot2")
  # qplot(State.UT.City, No..of.Cases.Reported, data = myCrimeData, geom="bar", stat = "identity")
  #-- ------------------------------------------------------------------------
     # stacking for 5 states
     
  crimeStack <- crimeState[1:5,]
   head(crimeStack)
   oneState  <- crimeStack[1,]
 #  qplot(oneState$State.UT.City, oneState$No..of.Cases.Reported, geom = "bar",stat = "identity")
 #--------------------------------------
   oneState1 <- oneState[,c(2:4)]
   ggplot(oneState1, aes(x = oneState1$State.UT.City, y=oneState1$No..of.Cases.Reported), fill = oneState1$No..of.Victims...Upto.10.Years,color = "green")+geom_bar(stat="identity", fill='red')
   
   a <- ggplot(oneState1, aes(x = State.UT.City, y=No..of.Cases.Reported))   +geom_bar(stat= "identity", fill="red")
   
   
  #--------------------------------------------------------------------------------------------------
   # melting the data
   library(reshape2)
   my1 <- crime[1,c(-1,-3)]
   my2 <- my1
   my3 <- melt(my2, id = "State.UT.City")
  
   
   # Cool graph
   
 #  qplot(my3$variable, my3$value, geom = "bar", stat = "identity", fill= my3$variable)
 
   library(ggplot2)
  ggplot(my3, aes( State.UT.City, value, fill =variable,) )+ geom_bar(stat="identity", width = 0.2,position = "dodge")
#---------------------------------------------------------------------
  library(plyr)
  myNew1 <- arrange(crimeState, No..of.Cases.Reported)
  myNew2 <- myNew1[21:25,]
  
  myNew3 <- myNew2[,c(-1,-3)]
  myNew4 <- myNew3
  
    myNew5 <- melt(myNew4, id = "State.UT.City")
   
  myPlot <- ggplot(myNew5, aes( State.UT.City, value, fill =variable,) )+ geom_bar(stat="identity", width = 0.6,position = "dodge")
   myPlot+ labs(title="Rape Data Analysis",x="5 states with maximum rape cases ",y="No of rape cases")
   
   #---------------------------------------------------------------------------
   
   m1 <- myNew1[1:5,]
   m2 <- m1[,c(-1,-3)]
   m3 <- m2
   m4 <- melt(m3, id = "State.UT.City")
   
   mPlot <- ggplot(m4, aes( State.UT.City, value, fill =variable,) )+ geom_bar(stat="identity", width = 0.6,position = "dodge")
   mPlot+scale_y_continuous(breaks = scales::pretty_breaks(n = 12))
   mPlot+ labs(title="Rape Data Analysis",x="5 states with minimum rape cases ", y= "No of rape cases")
   
   
   #---------------------------------------------------------------
    
   # percentatge rape cases total female population
   
   a1 <- crimeState[,c(2,3)]
   a2 <- arrange(a1,No..of.Cases.Reported)
   max_a2 <- a2[21:25,] 
   max_a2$total_population_female <-  c(27091465,46417977,39724832,78586558,28928245)
   max_a2$percentage_population1 <- max_a2$No..of.Cases.Reported*100/max_a2$total_population_female
   
   
   p <- ggplot(max_a2,aes(State.UT.City, percentage_population1, fill = State.UT.City))+ geom_bar(stat = "identity")
   #p+ scale_y_continuous(breaks = scales::pretty_breaks(n = 10))
   p+ labs(title="percentage over total female population")+coord_cartesian(ylim = c(0, 0.015))+ xlab("5 states with maximum rape cases")+ ylab("percentage")
 
   #----------------------------------------------------------
   
   