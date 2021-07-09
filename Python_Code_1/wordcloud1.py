from wordcloud import WordCloud

import matplotlib.pyplot as plt
import nltk
import numpy as np
from PIL import Image

#
# text=open('Steve_jobs_speech.txt').read()
#
# # spider_img = np.array(Image.open('spiderman.jpg'))
# wc=WordCloud().generate(text)
#
# plt.figure(figsize=(12,12))
# plt.imshow(wc, interpolation='bilinear')
# plt.axis('off')
# plt.show()
#
# ##빈도수
#
# plt.figure(figsize=(12,6))
# words = nltk.Text(text, name='단어 빈도수')
# words.plot(50)

import nltk
from konlpy.corpus import kolaw
from konlpy.tag import Twitter;  t=Twitter()

ko_con_text = kolaw.open('constitution.txt').read()

tokens_ko = t.nouns(ko_con_text)


stop_words=['입','제','월','일','조','수','때','그','이','바','및','안','등','애','로써','밖',
            '것','차','장','강','위','거나']
tokens_ko =[each_word for each_word in tokens_ko
            if each_word not in stop_words]
# print(tokens_ko)
## 불용어(사용하지 않는 단어) 제거> 분석에 의미를 찾을 수 없다! > Data mining (단어의 가치)


# firedragon=[]
#
# for i in tokens_ko:
#     if len(i)==1:
#         firedragon.append(i)
#
# print(firedragon)

##    많이 사용되는 단어 50개 추출

ko=nltk.Text(tokens_ko,name='대한민국 헌법')
ko.vocab().most_common(50)
print(ko.vocab().most_common(50))


###   WordCloud 에 넣기!   ###

data=ko.vocab().most_common(50)
tmp_data=dict(data)
greenhouse_img=np.array(Image.open('korea_mask.jpg'))
wordcloud = WordCloud(font_path='/Library/Fonts/malgun.ttf',
                      relative_scaling=0.2,
                      background_color='white',
                      mask=greenhouse_img).generate_from_frequencies(tmp_data)
plt.figure(figsize=(12,5))
plt.imshow(wordcloud)
plt.axis('off')
plt.show()


###  빈도수 체크 ####

plt.figure(figsize=(12,5))
words= nltk.Text(tokens_ko,name='단어 빈도수 확인')



import platform
import matplotlib.font_manager as fm
if platform.system() =='Darwin':
    plt.rc('font', family='AppleGothic')
elif platform.system() =='Windows':
    font_name = fm.FontProperties(fname='c:/Windows/Fonts/malgun.ttf').get_name()
    plt.rc('font', family=font_name)
else:
    print('Unknown system...sorry')


plt.figure(figsize=(12,5))
words=nltk.Text(tokens_ko,name='단어 빈도수 확인')
words.plot(50)
plt.show()
