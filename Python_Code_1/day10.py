import numpy as np
import pandas as pd
# arr=np.array([1,2,3,4,5,6])
# print(type(arr))
# print(arr)
# print(arr.shape)

# npzero=np.zeros([3,3])   ####   모든 값이 0 인 2차원 배열 생성
# print(npzero)

# npones=np.ones([2,3])     ### 모든 값이 1 인 2차원 배열 생성
# print(npones)

# npemptys=np.empty([4,4])     ### 값이 초기화되지 않은 임의의 배열 생성
# print(npemptys)

# nparrange=np.arange(10)
# print(nparrange)

# nparrange2 = np.arange(30).reshape([5,6])   ###reshape = 재구조화
#
# print(nparrange2)
#
# nparrange3= np.array(np.arange(20)).reshape((-1,5))
# print(nparrange3)

# arr1=np.array([[1,2,3,4,5]]); print(arr1)
# arr2=arr1.T
# print(arr2)    #####  전치(T, 구조변경) 수행 시 2차원 구조에서 가능 [[,,]]
#
# print(np.shape(arr1)); print(np.shape(arr2))

# arr=np.array([[1,2,3],
#              [4,5,6]])
# print(arr);print(arr.shape);print(arr.ndim);print(arr.dtype);print(arr.size)

# arr_int = np.array([1,2,3,4])   ##정수형 데이터
# print(arr_int.dtype)
#
# arr_float= arr_int.astype(np.float)   ### 데이터형태 변환 ( 형변환  )  ###
# print(arr_float.dtype)
# print(arr_int)
# print(arr_float)

# arr_str = np.array(['1','2','3'])
# print(arr_str)
# arr_int=arr_str.astype(np.int)
# print(arr_int.dtype)
#
# arr_str=arr_int.astype((np.str))
# print(arr_str)
# print(arr_str.dtype)

arr = np.array([[1,2,3],
                [4,5,6],
                [7,8,9]])

# print(arr.shape); print(arr)

# arr_1= arr[:2, 1:3] ; print(arr_1)
# arr_copy = arr[:2, 1:3].copy()
# print(arr_copy)
#
# arr_2 = arr[[0,1,2],[2,0,1]]
# print(arr_2)

#random number

# arr1 = np.random.seed(1);print(arr1)
# arr2 = np.arange(10)
# np.random.shuffle(arr2)
# print(arr2)
#
import matplotlib.pyplot as plt
#
# x=np.random.randint(-100,100,1000)  ##1000개의 랜덤 값 추출
# y=np.random.randint(-100,100,1000)
# size=np.random.rand(1) *100
#
# mask1=abs(x) > 50
# mask2=abs(y) > 50
#
# x=x[mask1 + mask2]
# y=y[mask1 + mask2]
#
# plt.scatter(x,y, s=size, c=x, cmap='jet',alpha=0.7)
# plt.colorbar()
# plt.show()

# help(plt.scatter)
