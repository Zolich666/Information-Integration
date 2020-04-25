import cv2
import numpy as np
from math import *

# 设定两个转换矩阵
RGB2IHS = np.array([(1/sqrt(3), 1/sqrt(3), 1/sqrt(3)),
                    (-2/sqrt(6), 1/sqrt(6), 1/sqrt(6)),   # RGB->IHS逆变换矩阵
                    (0, -1/sqrt(2), 1/sqrt(2))])
IHS2RGB = np.array([(1/sqrt(3), -2/sqrt(6), 0),
                    (1/sqrt(3), 1/sqrt(6), -1/sqrt(2)),   # IHS->RGB逆变换矩阵
                    (1/sqrt(3), 1/sqrt(6), 1/sqrt(2))])

if __name__ == "__main__":
    # 两幅图
    low_rgb = cv2.imread("images/low.jpg")
    high_rgb = cv2.imread("images/high.jpg")


    rows, cols, color = high_rgb.shape
    b, g, r = cv2.split(low_rgb)
    low_rgb.astype(np.float64)  # 将unit8转换成float64数据类型
    high_rgb.astype(np.float64)

    img_fus = np.zeros((rows, cols, 3), dtype=np.uint8)  # 创建空图作为融合后的存储


    for i in range(rows):
        for j in range(cols):
            low_d = RGB2IHS.dot(low_rgb[i, j, :])
            high_d = RGB2IHS.dot(high_rgb[i, j, :])  # 正变换
            tmp = np.array([high_d[0], low_d[1], low_d[2]])  # 采用高分辨率图像的明度

            fus = IHS2RGB.dot(tmp)
            img_fus[i, j, 0] = max(min(fus[0], 255), 0)
            img_fus[i, j, 1] = max(min(fus[1], 255), 0)
            img_fus[i, j, 2] = max(min(fus[2], 255), 0)  # 逆变换

    cv2.imshow("low", low_rgb)
    cv2.imshow("high", high_rgb)
    cv2.imshow("fusion", img_fus)
    cv2.waitKey(0)
cv2.destroyAllWindows()

