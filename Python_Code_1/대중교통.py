##!/usr/bin/env python
#coding: utf-8

## 데이타 분석- 대중교토 데이타 시각화하기

##대중교통 데이터 내려받기 - http://www.t-money.co.kr

##데이타 읽기 - 지하철 요금 : subwayfee.csv

#전체 데이타 불러오기
import csv

f= open('subwayfee.csv')
data=csv.reader(f)

next(data) #헤더 컬럼명 제거
mx=[0] * 4
mx_station = ['']*4

label = ['유임승차', '유임하차','무임승차','무임하차']
mn=0
rate=0

for row in data:
    #4열 ~7열: 숫자가 문자열 처리가 되어 있음 >>int로 형변환
    for i in data:
        for i in range(4,8):
            row[i] = int(row[i])

        if row[6]!=0 and (row[4]+row[6]) > 10000:
            rate=row[4]/row[6]
            if rate > mx:
                mx=rate
                mx_station = row[3] + ' ' + row[1]







#정제된 데이터 불러오기 (헤더 제거)

