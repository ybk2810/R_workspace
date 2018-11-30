# 단순회귀분석

# 독립변수 1개, 종속변수 1개
# y = ax + b

# 선형회귀분석
# 1. 변수 모델링 : y = ax1 + bx2 + c
# 2. 회귀모델 생성
# 3. 잔차(오차) 분석 : 독립성과 등분산성 검정, 잔차의 정규성 검정
# 4. 다중공선성 검사 : 지나치게 연관성이 큰 변수는 제거하기 위한 검사
# 5. 회귀모델 생성 / 평가

rm(list=ls())

result <- read.csv("product.csv", header = T)
result

str(result)

# 만족도 = 적절성 + 친밀도

y <- result$제품_만족도
x1 <- result$제품_적절성
x2 <- result$제품_친밀도

# y = ax1 + bx2 + c
result.lm <- lm(formula = y ~ x1 + x2, data = result)
summary(result.lm)

#  Coefficients:
#                Estimate   Std.Error  tvalue   Pr(>|t|)    
#  (Intercept)   0.66731    0.13094    5.096    6.65e-07 ***
#  x1            0.68522    0.04369    15.684   < 2e-16 ***
#  x2            0.09593    0.03871    2.478    0.0138 *  

# y(만족도) = 0.68522*x1(적절성) +0.09593*x2(친밀도) + 0.66731

# 학습데이터, 검정데이터 생성
#     7     :     3
# result
# train <= 70%
# test <= 30%

head(result)
dim(result)
a <- sample(1:nrow(result),nrow(result)*0.7)
train <- result[a,]
train
nrow(train)
test <- result[-a,]
test
nrow(test)

result.lm <- lm(formula = 제품_만족도 ~ 제품_적절성 + 제품_친밀도 , data = train)
summary(result.lm)

#  Coefficients:
#                Estimate    Std.Error     t value Pr(>|t|)    
#  (Intercept)   0.54249     0.15748       3.445   0.00071 ***
#  제품_적절성   0.71746     0.05228       13.724  < 2e-16 ***
#  제품_친밀도   0.09626     0.04678       2.058   0.04107 *  
#  y(제품_만족도) = 0.71746*(제품_적절성) + 0.09626*(제품_친밀도) + 0.54249

result.lm2 <- lm(formula = 제품_만족도 ~ 제품_적절성 + 제품_친밀도 , data = test)
summary(result.lm2)
#  Coefficients:
#               Estimate   Std.Error  t value    Pr(>|t|)    
#  (Intercept)  1.02908    0.23389    4.400      3.44e-05 ***
#  제품_적절성  0.59430    0.07950    7.476      1.03e-10 ***
#  제품_친밀도  0.08755    0.06885    1.272      0.207    
#  y(제품_만족도) = 0.5943*(제품_적절성) + 1.02908


#---------------------------------------------------------
data(iris)
names(iris)
# 변수 모델링
# 꽃받침의 길이 = 꽃받침의 너비, 꽃잎의 길이, 꽃잎의 너비
formula = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width
formula
model <- lm(formula = formula, data=iris)
model

# 독립성, 등분산성 검정
# 독립성
install.packages("lmtest")
library(lmtest)
# 보통 최소제곱(ordinary least sqares)으로 계산된 잔차를 이용하는 선형모델에서 오차항의 계열 상관을 검정하는것을 말한다.
# 최소제곱법에 의해 추정된 잔차
# d ==> 2에 가까우면 오차항들은 서로 독립이라고 할 수 있다.
# 0 : 양의 상관관계
# 4 : 음의 상관관계

dwtest(model)
# Durbin-Watson test
#data:  model
#DW = 2.0604, p-value = 0.6013
#alternative hypothesis: true autocorrelation is greater than 0
# 귀무가설 : 자기상관 <= 0
# 대립가설 : 자기상관 > 0

# 잔차 정규성 검정
attributes(model)
# coefficients : 상관계수
# residuals : 잔차
# fitted.value : 적합값

names(model)
res = resid(model)
res

# 잔차의 정규분포
# 귀무가설 : 저규분포와 차이가 없다.
# 대립가설 : 저규분포와 차이가 있다.

shapiro.test(res)
#shapiro-wilk normality test

# data: res
# W = 0.99559, p-value = 0.9349 > 0.05

# 잔차는 정규분포를 따른다고 할 수 있다.

# 다중 공선성 검사
# 독립변수에 강한 상관관계로 인해서 회귀분석의 결과를 신회할 수 없는 현상
# 생년월일, 나이

# 해결방법: 강한 상관관계를 갖는 돍립변수를 제거

install.packages("car")
library(car)

# 분산 팽창 인수 : vif(Vriance inflation Factor)

vif(model)
# Sepal.Width Petal.Length  Petal.Width 
# 1.270815    15.097572    14.234335 

sqrt(vif(model))
# Sepal.Width Petal.Length  Petal.Width 
# 1.127304     3.885559     3.772842 
sqrt(vif(model))>2
# 2 이상인 것은 다중 공선성 문제 의심

# 상관관계 확인 
cor(iris[,-5])
# 0.9628654 Petal.Width Petal.Length

formula<- Sepal.Length~Sepal.Width + Petal.Length
formula
model<- lm(formula = formula, data=iris)
summary(model)
# 결과 해석
#(Intercept)  7.04e-16 ***
#  Sepal.Width  1.16e-14 ***
#  Petal.Length  < 2e-16 ***

# 공식
#Coefficients:
#Estimate Std. Error t value
#(Intercept)   2.24914    0.24797    9.07
#Sepal.Width   0.59552    0.06933    8.59
#Petal.Length  0.47192    0.01712   27.57
# y(Sepal.Length) = 0.59552*Sepal.Width+0.47192*Petal.Length+2.24916

# iris data중 train 70%, test 30%
t<-sample(1:nrow(iris), nrow(iris)*0.7)
t

# 70% 모형에 적용
train<-iris[t,]
test<-iris[-t,]


#-----------------------------------------------
# 분석
result.lm<-lm(formula=formula, data=train)
summary(result.lm)

# y=ax1+bx2+c

# y = 0.61171*x1+0.47741*x2+2.19143

# 회귀분석 결과를 대상으로 회귀방정식을 적용한 새로운 값 예측

# predict(result, test Set)

result2<- predict(result.lm,test)
result2

length(result2)
head(test)
head(result2)

test$result2<-result2
test
str(test)
test[,c("Sepal.Length","result2")]

#-----------------------------------------------------------

# 회귀방정식 적용
# 상품 구매 금액 예측
rm(list=ls())
data<-read.csv("product_sales.csv",header = T)
data
# tot_price visit_count buy_count avg_price

# train: 7 test: 3
t<-sample(1:nrow(data), nrow(data)*0.7)
train<-data[t,]
test<-data[-t,]
nrow(train); nrow(test)
# 총 구매금액, 구매횟수, 평균구매액, 방문횟수

# 종속변수 : 총 구매금액
# 독립변수 : 구매횟수, 평균구매액, 방문횟수

# y = ax1 + bx2 + cx3+d
model<-lm(tot_price~visit_count+buy_count+avg_price, data=train)

summary(model)

#tot_price=-0.51599*visit_count+0.47244*buy_count+0.64838*avg_price+2.62394

#Coefficients:
#  Estimate Std. Error t value Pr(>|t|)
#(Intercept)  2.69840    0.30580   8.824 3.46e-14
#visit_count -0.44571    0.17926  -2.486   0.0145
#buy_count    0.42746    0.08581   4.982 2.61e-06
#avg_price    0.63909    0.07661   8.343 3.90e-13

#(Intercept) ***
#  visit_count *  
#  buy_count   ***
#  avg_price   ***

library(lmtest)

dwtest(model)
# data:  model
# DW = 1.8143, p-value = 0.17
res<-resid(model)
res
shapiro.test(res)
#Shapiro-Wilk normality test
#data:  res
#W = 0.98966, p-value = 0.6032

#공선성 검사
sqrt(vif(model))
sqrt(vif(model))>2

str(data)

cor(data[,-1])
# 0.9627571: avg_price, visit_count

result.lm<-lm(formula = tot_price~buy_count + avg_price, data=train)
summary(result.lm)
#Coefficients:
#Estimate Std. Error t value Pr(>|t|)    
#(Intercept)  2.92637    0.29904   9.786 2.43e-16 ***
#  buy_count    0.40463    0.08745   4.627 1.09e-05 ***
#  avg_price    0.45595    0.02158  21.133  < 2e-16 ***
#y = 0.40463*buy_count+0.45595*avg_price+2.92637

pred<-predict(result.lm, test)
pred

test$pred<-pred
head(test[,c("tot_price","pred")],5)









