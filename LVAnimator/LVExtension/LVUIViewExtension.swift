//
//  DCUIViewExtension.swift
//  Datacans
//
//  Created by GRV on 2018/7/20.
//  Copyright © 2018年 GRV. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func filterCircle(color: UIColor, size: CGFloat) {
        backgroundColor = color
        layer.borderWidth = 1
        layer.cornerRadius = size / 2
        isUserInteractionEnabled = false
        switch color {
        case .lvWhite1A3:
            layer.borderColor = UIColor.lvGray3A6.cgColor
        case .lvBlue4A8:
            layer.borderColor = UIColor.lvBlue4.cgColor
        case .lvYellow1A8:
            layer.borderColor = UIColor.lvYellow1.cgColor
        case .lvGreen1A8:
            layer.borderColor = UIColor.lvGreen1.cgColor
        case .lvRed1A8:
            layer.borderColor = UIColor.lvRed1.cgColor
        default:break
        }
    }
}
