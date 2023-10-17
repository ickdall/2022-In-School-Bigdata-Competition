install.packages("CausalImpact")
install.packages('tidyr')
install.packages('lubridate')
library(CausalImpact)
library(tidyr)
library(dplyr)
library(lubridate) 
setwd('C:/Users/dmz38/Downloads/1654157067295-데멘토_지원신청서_및_개인정보활용동의서')

# 2018-03을 시작으로 월을 기준으로 2022-05-01까지의 Date형태의 변수 생성
time.points <- seq.Date(as.Date('2018-03-01'),by='month', length.out = 52)
str(time.points)
# 코로나 영향을 받기전과 코로나 영향을 받고 난뒤의 날짜를 분리 지정
pre.period <- as.Date(c("2018-03-01", "2020-01-01"))
post.period <- as.Date(c("2020-02-01", "2022-05-01"))

# 지역별 제곱미터당 권리금(이상치 제거)
df11 <- read.csv('제곱 권리금(이상치).csv')
df11
df_11 <- df11[,c(2:17)] # 날짜 컬럼을 제외한 사용할 컬럼 추출
df_1_9 <- zoo(df_11, time.points) # 예측할 데이터와 Date 변수 합치기
impact <- CausalImpact(df_1_9, pre.period, post.period) # causalimpact 실행

plot(impact)
summary(impact)

# 지역별 권리금(이상치 제거)
df12 <- read.csv('지역별 권리금(이상치).csv')
df12
df_12 <- df12[,c(2:17)]
df_1_10 <- zoo(df_12, time.points)
impact <- CausalImpact(df_1_10, pre.period, post.period)

plot(impact)
summary(impact)

# 지역별 유동인구(이상치 제거)
df14 <- read.csv('지역별 유동인구(이상치).csv')
df14
df_14 <- df14[,c(2:17)]
df_1_12 <- zoo(df_14, time.points)
impact <- CausalImpact(df_1_12, pre.period, post.period)

plot(impact)
summary(impact)


# 업종별 제곱미터당 권리금
df15 <- read.csv('업종별 제곱 지원금(이상치).csv')
df15
df_15 <- df15[,c(2:9)]
df_1_13 <- zoo(df_15, time.points)
impact <- CausalImpact(df_1_13, pre.period, post.period)

plot(impact)
summary(impact)


# 업종별 권리금(이상치)
df16 <- read.csv('업종별 권리금(이상치).csv')
df16
df_16 <- df16[,c(2:9)]
df_1_14 <- zoo(df_16, time.points)
impact <- CausalImpact(df_1_14, pre.period, post.period)

plot(impact)
summary(impact)

# 업종별 매매가(이상치)
df17 <- read.csv('업종별 매매가(이상치).csv')
df_17 <- df17[,c(2:9)]
df_1_15 <- zoo(df_17, time.points)
impact <- CausalImpact(df_1_15, pre.period, post.period)

plot(impact)
summary(impact)
