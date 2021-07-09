# import numpy as np
# import matplotlib
# import matplotlib.pyplot as plt
# import matplotlib.font_manager as fm
# from matplotlib import colors
#
# def get_populs():
#     f=open('kor_populations.csv', 'r', encoding='UTF-8')
#     areas, populs, ratios = [],[],[]
#     for row in f:
#         area,popul,ratio = row.strip().split(':')
#         popul=int(popul.replace(',',''))
#
#         print(area,popul,float(ratio))
#
#         areas.append(area)
#         populs.append(popul)
#         ratios.append(ratio)
#
#     f.closed
#
#     return areas,populs,ratios
#
# # def plt_show():
# #     areas,populs,ratios= get_populs()
# #     idx=np.arange(len(populs))
# #
# #     fname = 'C:\Windows\Fonts\malgun.ttf'
# #     font_name = fm.FontProperties(fname=fname).get_name()
# #     matplotlib.rc('font', family=font_name)
# #
# #     plt.figure(1)
# #     plt.bar(idx,populs,color=colors.TABLEAU_COLORS)
# #     plt.xticks(idx,areas,rotation=30)
# #     plt.subplots_adjust(bottom=0.2)
# #     plt.title('2018 KOREA POPULATIONS 17')
# #
# #     plt.figure(2)
# #     plt.pie(ratios,labels=areas, shadow=True, startangle=90)
# #
# #     plt.show()
# #
# #     plt.show()
# #
# # plt_show()
#
#
# ###그래프 하나에 다 넣기#####
#
# def plt_show():
#     areas,populs,ratios= get_populs()
#     idx=np.arange(len(populs))
#
#     fname = 'C:\Windows\Fonts\malgun.ttf'
#     font_name = fm.FontProperties(fname=fname).get_name()
#     matplotlib.rc('font', family=font_name)
#
#     plt.subplot(221)  ##첫번째 2열수, 두번째 2행수, 마지막 1은 4개 자리 중 첫번째 자리
#     plt.bar(idx,populs,color=colors.TABLEAU_COLORS)
#     plt.xticks(idx,areas,rotation=30)
#     plt.subplots_adjust(bottom=0.2)
#     plt.title('2018 KOREA POPULATIONS 17')
#
#     plt.subplot(222)
#     plt.pie(ratios,labels=areas, shadow=True, startangle=90)
#
#     plt.show()
#
#     plt.show()
#
# plt_show()
#
