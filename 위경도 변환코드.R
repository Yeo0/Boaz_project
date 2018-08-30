# ggmap, XML, rvest, sp 패키지 설치
# 내려받은 csv 파일을 read
# 서울시 공공데이터에 로그인하여 API token key를 발급
install.packages("sp")
install.packages("XML")
install.packages("ggmap")
install.packages("rvest")
install.packages("rgdal")

library(sp)
library(XML)
library(ggmap)
library(rvest)
library(rgdal)

setwd("C:\\Users\\wooli\\Desktop\\컨퍼런스")

address <-read.csv("서울시 각종 학교 현황.csv", header=T, stringsAsFactors=F)[,10] #### 내려받은 csv 파일의 주소 열을 address로 할당
address

address<-address[which(address$객실수>0),]
address<-address[,1]

head(address)
length(address)

#address <- unlist(strsplit(address, split=')', fixed=TRUE))

xydfr <- geocode(enc2utf8(address),source="google",output="latlona")
xydfr
urlbase1 <- "http://swopenAPI.seoul.go.kr/api/subway"
token <- "4973724658776f6f383669676e6670" #### 서울시 공공데이터에서 인증받은 key를 입력
urlbase2 <- "xml/nearBy/1/1000"

TMtrans1 <- CRS("+proj=longlat +zone=52 +ellps=WGS84 +datum=WGS84
                +units=m +no_defs +lat_0=38N +lon_0=127E")
TMtrans2 <- CRS("+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=500000
                +ellps=bessel +units=m +no_defs")
xydfr<-na.omit(xydfr)
TMxy <- spTransform(SpatialPoints(xydfr[,-3],proj4string=TMtrans1),TMtrans2)
TMxy1 <- as.data.frame(TMxy)
length(TMxy)
url <- paste(urlbase1,token,urlbase2,TMxy1[,1],TMxy1[,2],sep="/")
# url 변수가 여러 개의 http 주소를 담고 있는 character vector인지 확인
url
output <- list()
for(i in 1:length(url)) {
  parsed <- read_html(url[i])
  statnm <- html_text(html_nodes(parsed,css='statnnm'))
  subwaynm <- html_text(html_nodes(parsed,css='subwaynm'))
  subwayx <- html_text(html_nodes(parsed,css='subwayxcnts'))
  subwayy <- html_text(html_nodes(parsed,css='subwayycnts'))
  output[[i]] <- cbind(statnm,subwaynm,subwayx,subwayy)
  cat(i,"번째 진행중... ","\n")
}; cat("완료!")
save(output,file="output.RData")

output
write.csv(output, 'output.csv')
# for문 안에만 수정하면 됨
