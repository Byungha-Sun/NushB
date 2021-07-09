from wordcloud import WordCloud

import matplotlib.pyplot as plt
import nltk
import numpy as np
from PIL import Image


text=open('Steve_jobs_speech.txt').read()

# spider_img = np.array(Image.open('spiderman.jpg'))
wc=WordCloud().generate(text)

plt.figure(figsize=(12,12))
plt.imshow(wc, interpolation='bilinear')
plt.axis('off')
plt.show()