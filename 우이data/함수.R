
install.packages("dplyr")
library(dplyr)


setwd("C:\\Users\\wooli\\Desktop\\우이")
a<-read.csv("돈암2동_인구.csv", header=T) #숫자 셀 때 인구수로 세세요
b<-read.csv("돈암2동_가구.csv", header=T)
c<-read.csv("돈암2동_주택.csv", header=T)
d<-read.csv("돈암2동_사업체.csv", header=T)

            

aa<-full_join(a,b,by="집계구번호")
bb<-full_join(aa,c,by="집계구번호")            
cc<-full_join(bb,d,by="집계구번호")
res<-cc[c(26,9,37,4,32,29,21,35,18,30),c("값.x","값.y","값.x.x","값.y.y")] #row 숫자만 각자 센 숫자로요 바꿔주심됩니다

sav3<-colSums(res,na.rm=T) #바꿀때마다 sav1, sav2 이런식으로 저장 

fin<-rbind(sav1,sav2,sav3) # 동개수만큼 추가 
colSums(fin)
