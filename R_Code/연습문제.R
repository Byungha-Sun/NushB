##p258
#1)
drink <- c('콜라','사이다','환타','핫식스','몬스터')
drink

#2)
drink[-c(1,4)]

#3)
vec1 <- c('홍길동','강감찬','김유신')
vec2 <- c('송강호','나문희')
vec3 <- c(vec1,vec2)
vec3
length(vec1)

#p262
#1)
fruit <- matrix(c('감자','고구마','당근','양파'),ncol=2)
fruit

#2)
mat <- matrix(c(1:20),nrow=4)
mat
mat[c(1,3),c(1,2,4)]

#p268
#1)
list <- data.frame('번호'=1000,
                   '고객명'='홍길동',
                   '상품명'='맛동산',
                   '구매일자'='2018-01-11',
                   '금액'=500)
list
list$번호

list[,c(1,2,5)]



#p301
#1)
do_hap <- function(a,b){
    if(a>b){
        return(a-b)
    }else{
        return(b-a)
    }
}
do_hap(3,2)
do_hap(2,4)


#2)
travel=function(a){
    if(a=='봄'){
        print('봄 여행이 최고죠~!')
    }else if(a=='가을'){
        print('가을 여행이 최고죠~!')
    }else{
        print('내년 봄이나 가을에 여행가세요~^^')
    }
}
travel('봄')
travel('가을')
travel('겨울')


#p305****
#1)
char1 <- c('새우깡','맛동산','자갈치','칸쵸','허니버터칩')
cnt <- 0
while(T){
    cnt=cnt+1
    if(char1[cnt]!='칸쵸'){
        print(paste('내사랑',char1[cnt]))
    }else{
        break
    }
}



# #2)*****
cnt <- 0
while(T){
    cnt=cnt+1
    if(char1[cnt]!='칸쵸'){
        print(paste(char1[cnt],' 너 좋아!'))
    }else if(char1[cnt]=='칸쵸'){
        print(paste(char1[cnt],' 너 미워!'))
    }else{
        break
    }
}
# 
# 
# 
# 
# #p308
# #1)
# for(i in 1:length(char1)){
#     print(paste('내사랑',char1[i]))
# }

#2) *****
# for(i in 1:length(char1)){
#     if (char1[i]=='새우깡'|char1[i]=='칸쵸'|char1[i]=='허니버터칩'){
#         print(paste(char1[i],' 너 좋아!'))
#     }else{
#         print(paste(char1[i],' 너 미워!'))
#     }
# }
# 
# 
# #3)
# gugudan <- function(x){
#     for (i in 1:9){
#         print(paste(x,'x',i,'=',x*i))
#     }
# }
# gugudan(3)
# 
# #4)
# for4 <- function(x){
#     for (i in 1:x){
#         print(paste(i*10,' 번 앞으로 나오세요!'))
#     }
# }
# for4(4)
# 
# #5)
# veg=c('감자','고구마','버섯','당근','양배추')
# x <- 0
# for (i in 1:length(veg)){
#     if (veg[i]=='버섯'){
#         next
#     }else{
#         print(paste(veg[i],' 좋아요~'))
#     }
# }
