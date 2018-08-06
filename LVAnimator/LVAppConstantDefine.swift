//
//  LVAppConstantDefine.swift
//  LVAnimator
//
//  Created by GRV on 2018/7/5.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

let Screen_B = UIScreen.main.bounds
let Screen_W = Screen_B.size.width
let Screen_H = Screen_B.size.height
let Status_H = UIApplication.shared.statusBarFrame.size.height
let Is_X = Screen_H == 812
let Nav_H = Status_H + 44
let Tab_H = Is_X ? 83 : 49
let Top_X_H = Is_X ? 44 : 0
let Top_X_S_H = Is_X ? 44 : Status_H
let Bottom_X_H = Is_X ? 35 : 0
