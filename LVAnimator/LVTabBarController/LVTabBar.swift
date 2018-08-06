//
//  LVTabBar.swift
//  LVTabBarController
//
//  Created by GRV on 2018/6/21.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVTabBar: UITabBar {
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        if !isHidden {
            for subView in subviews {
                let tp = subView.convert(point, from: self)
                if subView is LVTabBarView {
                    for item in subView.subviews {
                        if item is LVTabBarItem {
                            if item.frame.contains(tp) {
                                return item
                            }
                        }
                    }
                }
            }
        }
        return view
    }
}
