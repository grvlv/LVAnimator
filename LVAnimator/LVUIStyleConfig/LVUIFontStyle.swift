//
//  LVUIFontStyle.swift
//  LVAnimator
//
//  Created by GRV on 2018/7/4.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func lvPFR14() -> UIFont? {
        return UIFont(name: "PingFangSC-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14)
    }
    
    class func lvPFM14() -> UIFont? {
        return UIFont(name: "PingFangSC-Medium", size: 14) ?? UIFont.systemFont(ofSize: 14)
    }
    
    class func lvPFM13() -> UIFont? {
        return UIFont(name: "PingFangSC-Medium", size: 13) ?? UIFont.systemFont(ofSize: 13)
    }
    
    class func lvPFR12() -> UIFont? {
        return UIFont(name: "PingFangSC-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    class func lvPFM12() -> UIFont? {
        return UIFont(name: "PingFangSC-Medium", size: 12) ?? UIFont.systemFont(ofSize: 12)
    }
    
    class func lvPFM10() -> UIFont? {
        return UIFont(name: "PingFangSC-Medium", size: 10) ?? UIFont.systemFont(ofSize: 10)
    }
}
