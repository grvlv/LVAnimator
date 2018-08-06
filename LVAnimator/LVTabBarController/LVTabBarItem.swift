//
//  LVTabBarItem.swift
//  LVTabBarController
//
//  Created by GRV on 2018/6/21.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVTabBarItem: UIControl {
    
    var isCenter = false
    var title: String?
    var normalIamge: UIImage?
    var selectImage: UIImage?
    let icon = UIImageView()
    let label = UILabel()
    var size: CGFloat {
        get {
            return isCenter ? 60 : 24
        }
    }
    
    func setup() {
        icon.contentMode = .scaleAspectFit
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        if let text = title, text.count > 0 {
            label.text = text
            label.sizeToFit()
        } else {
            label.isHidden = true
        }
        addSubview(icon)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        let width = frame.size.width
        let height = frame.size.height
        let iconX = (width - size) / 2
        let iconY = label.isHidden ? (height - size) / 2 : (height - size - label.frame.size.height - 2) / 2
        icon.frame = CGRect(x: iconX, y: iconY, width: size, height: size)
        label.frame = CGRect(x: (width - label.frame.size.width) / 2, y: icon.frame.origin.y + icon.frame.size.height + 2, width: label.frame.size.width, height: label.frame.size.height)
    }
    
    func select() {
        icon.image = isSelected ? selectImage : normalIamge
        label.textColor = isSelected ? .blue : .gray
    }
    
    func scaleAnimation() {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [1, 1.2, 0.9, 1.1, 0.95, 1.05, 1]
        animation.duration = 0.6
        animation.calculationMode = kCAAnimationCubic
        icon.layer.add(animation, forKey: nil)
    }
}
