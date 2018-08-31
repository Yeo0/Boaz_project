
data300<-read.csv("C:/Users/wooli/Documents/카카오톡 받은 파일/소지역단위 데이터300.csv")
data500<-read.csv("C:/Users/wooli/Documents/카카오톡 받은 파일/소지역단위 데이터500.csv")
test<-read.csv("C:/Users/wooli/Documents/카카오톡 받은 파일/2015년 7호선 일별 승하차인원.csv", header=F)
data300
data500
head(test)
test1<-test[,c(2,4)]
names(test1)<-c("역","일별이용객")
head(test1)

test11<-aggregate(일별이용객~역,test1,mean)
test11


df<-data.frame(test11,data500[,c(3,5)])
df




lm(일별이용객~가구+사업체,df)

summary(lm(일별이용객~가구+사업체,df)) 







