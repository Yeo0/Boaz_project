load("output_anotherschool.RData")
load("output_middleschool.RData")
load("output_highschool.RData")
load("숙박2.RData")
load("숙박1.RData")
load("외국인도시민박업.RData")
load("숙박3.RData")
load("서울시 문화재 현황.RData")
load("문화공간.RData")

library(sp)


setwd("C:\\Users\\wooli\\Desktop")

a <- read.csv("서울시 외국인관광 도시민박업 정보 (한국어).csv",stringsAsFactors=FALSE)
head(a)
str(a)
#a<-a[-which(a$객실수==NA,]

a<-a[complete.cases(a[,9]),]

head(a)
str(a)

a$도로명주소

# a$주소
# str(a$주소)

library(ggmap)
address <- a$도로명주소## 각자 지정한 csv 파일의 주소를 벡터로 저장
load("문화공간.RData") ## 각자 지정한 RData 파일의 이름을 기입

xydfr <- geocode(enc2utf8(address),source="google",output="latlona")

RD <- function(origin,comparison) {
  if(class(origin)!="data.frame") stop("'origin' should be data.frame")
  if(class(comparison)!="list") stop("'comparison' should be list")
  TMtrans1 <- CRS("+proj=longlat +zone=52 +ellps=WGS84 +datum=WGS84
                  +units=m +no_defs +lat_0=38N +lon_0=127E")
  TMtrans2 <- CRS("+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000
                  +ellps=bessel +units=m +no_defs")
  dt <- list()
  for(i in 1:nrow(origin)) {
    WGSxy <- spTransform(SpatialPoints(matrix(as.numeric(comparison[[i]][,3:4]),ncol=2),proj4string=TMtrans2),TMtrans1)
    WGSxy2 <- as.data.frame(WGSxy)
    dt[[i]] <- acos(cos((90-origin[i,2])*pi/180)*cos((90-WGSxy2[,2])*pi/180)+sin((90-origin[i,2])*pi/180)*sin((90-WGSxy2[,2])*pi/180)*cos((origin[i,1]-WGSxy2[,1])*pi/180))*6371
  }
  dt
}

ab <- RD(xydfr[,-3],output)
str(ab)
aa <- matrix(unlist(ab),ncol=10,byrow=TRUE)
bbb <- matrix(1,nrow=10)
cccc <- matrix(1,nrow=10)
for(i in 1:nrow(xydfr)) {bbb <- cbind(bbb,output[[i]][,1])}
for(i in 1:nrow(xydfr)) {cccc <- cbind(cccc,output[[i]][,2])}
cccc <- t(cccc[,-1])
bbb <- t(bbb)
bbb<-bbb[-1,]


str(ddd)
ddd<-cbind(xydfr,aa,cccc,bbb)
write.csv(ddd,"high!!.csv")




