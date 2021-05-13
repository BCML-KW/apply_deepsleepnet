# -*- coding: utf-8 -*-
"""
Created on Mon Nov 30 18:25:03 2020

@author: BMCL
"""
import os
import numpy as np
import pandas as pd

path = r'F:\Sleep_data\HMM_HyunSoo\from_Prof\HMM_USB\HMM Training-20190521T025158Z-001\HMM Training\HMMcodes_CP\DeepSleepNet_Label\BCG_result_1215\pred_15Dec\pred_15Dec'
file_list = os.listdir(path)
for i in range(0,30):
    new_path = path + '\\' + file_list[i]
    predict = np.load(new_path, allow_pickle=True)    
    np.savetxt(new_path[0:-4]+'.csv', predict, delimiter=",")