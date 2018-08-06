//
//  LVTabBarView.swift
//  LVTabBarController
//
//  Created by GRV on 2018/6/21.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

protocol LVTabBarViewDelegate : class {
    func tabBarSelect(index: Int)
}

class LVTabBarView: UIView {
    
    weak var delegate : LVTabBarViewDelegate?
    var items = [LVTabBarItem]()
    var lastIndex = 0
    
    func setupItems(arr: [[String : String]]) {
        backgroundColor = .white
        for (index, value) in arr.enumerated() {
            let item = LVTabBarItem()
            item.tag = index
            item.title = value["title"]
            item.normalIamge = UIImage(named: value["image"] ?? "")
            item.selectImage = UIImage(named: value["selected_image"] ?? "")
            item.addTarget(self, action: #selector(LVTabBarView.selectItem(sender:)), for: .touchUpInside)
            if index == 0 {
                item.isSelected = true
            }
            if index == 2 {
                item.isCenter = true
            }
            item.select()
            item.setup()
            addSubview(item)
            items.append(item)
        }
    }
    
    override func layoutSubviews() {
        let itemWidth: Double = Double(frame.size.width) / Double(items.count)
        let itemHeight: Double = 48
        for (index, item) in items.enumerated() {
            item.frame = CGRect(x: Double(index) * itemWidth, y: item.isCenter ? -10 : 0, width: itemWidth, height: itemHeight)
        }
    }
    
    @objc func selectItem(sender: LVTabBarItem) {
        let currentIndex = sender.tag
        if currentIndex == 2 {
            delegate?.tabBarSelect(index: currentIndex)
            return
        }
        if lastIndex != currentIndex {
            lastIndex = currentIndex
            delegate?.tabBarSelect(index: currentIndex)
            sender.scaleAnimation()
            for (index, item) in items.enumerated() {
                item.isSelected = sender.tag == index
                item.select()
            }
        }
    }
}
