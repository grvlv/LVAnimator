//
//  LVThirdDetailCellModel.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

enum LVThirdDetailCellType: Int, Codable {
    case weibo
    case qzone
    case qq
    case wechat
    case pengyouquan
    case copyurl
    case card
    case rule
    case message
    case white
    case blue
    case orange
    case green
    case red
}

class LVThirdDetailCellModel : Codable {
    
    var cellType: LVThirdDetailCellType?
    var text: String?
    var iconPath: String?
    
    func analysisType(type: LVThirdDetailCellType) {
        cellType = type
        switch type {
        case .weibo:
            iconPath = "share_weibo"
            text = "新浪微博"
        case .qzone:
            iconPath = "share_qzone"
            text = "QQ空间"
        case .qq:
            iconPath = "share_qq"
            text = "QQ"
        case .wechat:
            iconPath = "share_wechat"
            text = "微信好友"
        case .pengyouquan:
            iconPath = "share_pengyouquan"
            text = "朋友圈"
        case .copyurl:
            iconPath = "share_link"
            text = "复制链接"
        case .card:
            iconPath = "share_link"
            text = "卡片"
        case .rule:
            iconPath = "share_link"
            text = "规则"
        case .message:
            iconPath = "share_link"
            text = "消息"
        case .white:
            text = "透明"
        case .blue:
            text = "蓝色"
        case .orange:
            text = "橙色"
        case .green:
            text = "绿色"
        case .red:
            text = "红色"
        }
    }
}
