//
//  LVSecondDetailSectionModel.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

class LVSecondDetailSectionModel : Codable {
    
    var allowsMultiple: Bool?
    var lastIndex: Int?
    var title: String?
    var iconPath: String?
    var description: String?
    var cellModel: [LVSecondDetailCellModel]?
}
