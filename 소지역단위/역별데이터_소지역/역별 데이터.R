line1500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (1_500).csv", header=T)
line1300<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (1_300).csv", header=T)
line2300<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (2_300).csv", header=T)
line2500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (2_500).csv", header=T)
line3300<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (3_300).csv", header=T)
line3500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (3_500).csv", header=T)
line4300<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (4_300).csv", header=T)
line4500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (4_500).csv", header=T)
line5300<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (5_300).csv", header=T)
line5500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (5_500).csv", header=T)
line6300<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (6_300).csv", header=T)
line6500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (6_500).csv", header=T)
line7300<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (7_300).csv", header=T)
line7500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (7_500).csv", header=T)
line8300<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (8_300).csv", header=T)
line8500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (8_500).csv", header=T)
line9300<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (9_300).csv", header=T)
line9500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/소지역단위 역별 데이터 (9_500).csv", header=T)
# line1300,line1500,line2300, line2500, line3300, line3500, line4300, line4500, line5300, line5500, line6300, line6500, line7300, line7500, line8300, line8500, line9300, line9500

ppl151<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/15년 1월 역별 시간대별 이용인원.csv", header=T, stringsAsFactors=T)
head(ppl151)

sumrow<-as.numeric(ppl151[,30])
ppl151<-data.frame(ppl151[1:29],sumrow)
df<-aggregate(sumrow~역명,ppl151,sum)


num1<-as.numeric(ppl151[,7])
num2
cl
df<-data.frame(ppl151[1:6],num,ppl151[8:29])
head(df)
head(ppl151)
class(df[,7])


k=c()
k
k[1]=as.numeric(ppl151[,6])

for(i in 1:24){
  k[,i]=as.numeric(ppl151[,i+5])
  
}

warning()

ppll151<-data.frame(ppl151[1:5],num)

head(ppl151)
ncol(ppl151)
class(ppl151[,7])



sum<-sum(ppl151[,6:29])
test11<-aggregate(합~역명,ppl151,mean)

data500<-rbind(line1500, line2500, line3500, line4500, line5500, line6500, line7500, line8500, line9500)
data300<-rbind(line1300, line2300, line3300, line4300, line5300, line6300, line7300, line8300, line9300)
write.csv(data500,"C:/Users/wooli/Desktop/컨퍼런스/역별데이터/data500.csv")
write.csv(data300,"C:/Users/wooli/Desktop/컨퍼런스/역별데이터/data300.csv")

table(data500)




##승하차인원수랑  2015년 승하차 인원


data500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/data500.csv")
c500<-read.csv("C:/Users/wooli/Desktop/컨퍼런스/역별데이터/크롤링/500m.csv")
data500
c500
merge(c500[,2],data500[,2],"호선")
