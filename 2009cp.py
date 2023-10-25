
import matplotlib.pyplot as plt 
import matplotlib.font_manager as fm
import seaborn as sns
import numpy as np
import pandas as pd 
plt.style.use('ggplot')
# 中文字体
plt.rcParams['font.family'] = ['Arial Unicode MS']
font_path = '/System/Library/Fonts/PingFang.ttc'
font_prop = fm.FontProperties(fname=font_path, size=16)


df=pd.read_csv('2009CP-1.csv',encoding='utf-8')
df.head()