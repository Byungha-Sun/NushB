# import numpy as np
# import matplotlib
# import matplotlib.pyplot as plt
# import matplotlib.font_manager as fm
# from matplotlib import colors
#
# from matplotlib import font_manager, rc
# font_name = fm.FontProperties(fname="c:/Windows/Fonts/malgun.ttf").get_name()
# plt.rc('font', family=font_name)
# plt.rc('font', family='Malgun Gothic')
#
# def get_gukto():  ###   gdp.csv 파일을 정제하는 함수
#     f=open('gukto.csv','r', encoding='UTF-8')
#     names, widths = [], []
#
#     for row in f:
#         name, width = row.strip().split(':')  # 2개의 열만 가져오는 unpacking
#         width = int(width.replace(',', ''))
#         # 수치 계산을 위해 콤마제거, but,money는 string
#
#         print(name, width)
#         names.append(name)
#         widths.append(width)
#     f.closed
#     return names, widths
#
#
# def plt_show():
#     names, widths = get_gukto()
#     idx = np.arange(len(widths))
#     fname = 'C:\Windows\Fonts\malgun.ttf'
#     font_name = fm.FontProperties(fname=fname).get_name()
#     matplotlib.rc('font', family=font_name)
#
#     plt.bar(idx, widths, color=colors.TABLEAU_COLORS)
#     plt.xticks(idx, names, rotation='vertical')
#
#     plt.subplots_adjust(bottom=0.2)
#
#     plt.show()
#
#
# plt_show()
