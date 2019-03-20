#Q1
price_of_bond = function(C,f,n,y){  
#C is coupon,F is face value, n is the number of coupon payments,y are the interest rates and here is a vector
  price = 0
  for(i in 1:length(n)){
  price = price+C*(exp(1))^(-y[i]*i)
}
  price = price + f*(exp(1))^(-y[n]*n)
  return(price)
  }


#Q3
singapore.economy=read.csv("C:/Users/THINK/Desktop/ACST890/THQ1/singapore.economy.csv")
se = singapore.economy
senew = na.omit(se)
plot(senew$time,senew$gdp,xlab="Time",ylab="GDP(%)",main="Singapore GDP growth")
a=tapply(senew$gdp, list(period=senew$period), mean)
b=tapply(senew$gdp, list(period=senew$period), sd)
stat.table=matrix(c(a,b),ncol=3,byrow=TRUE)
colnames(stat.table) = c("1","2","3")
rownames(stat.table) = c("mean","sd")
stat.table = as.table(stat.table)
stat.table
pairs(senew[3:10])
model1 = lm(gdp~exp, data=senew)
summary(model1)
model2 = lm(gdp~exp+epg+hpr+oil+gdpus+crd, data=senew)
summary(model2)

#h
quantile(senew$gdp,probs = seq(0, 1, 0.05))
state = ifelse(senew$gdp>-2.518, c("0"), c("1")) 
senew1=data.frame(senew,state)
senew2=subset(senew1,time<2008)
model3 = glm ( state~bci, data = senew2 , family = binomial )
summary(model3)
glm.probs=predict (model3,type="response")
glm.pred=rep("0" ,72)
glm.pred[glm.probs >.5]="1"
table(glm.pred ,senew2$state)
