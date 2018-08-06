//
//  LVSecondDetailCellHeader.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit
import Iconic

class LVSecondDetailCellHeader: UIView {
    
    var model: LVSecondDetailSectionModel?
    let title = UILabel()
    let btn = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect())
        
        title.font = .lvPFM12()
        title.textColor = .lvBlack2
        addSubview(title)
        addSubview(btn)
        setupConstraints()
    }
    
    func setupConstraints() {
        title.snp.remakeConstraints { (make) in
            make.left.equalTo(16)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        btn.snp.remakeConstraints { (make) in
            make.size.equalTo(22)
            make.left.equalTo(title.snp.right)
            make.centerY.equalTo(title)
        }
    }
    
    func setupData(data: Any?) {
        model = data as? LVSecondDetailSectionModel
        if let m = model {
            title.text = m.title
            if let iconPath = m.iconPath {
                btn.setImage(Iconic.image(withIcon: Icon(named: iconPath), size: CGSize(width: 12, height: 12), color: .lvGray2), for: .normal)
                btn.addTarget(self, action: #selector(LVSecondDetailCellHeader.btnPressed(sender:)), for: .touchUpInside)
            }
        }
    }
    
    @objc func btnPressed(sender: UIButton) {
        LVPopView().show(text: "包含文本字段，会使得只有数字字段的数据源在搜索结果中被排除；选择包含文本字段，则会使只有文本字段的数据源在搜索结果中被排除。", width: frame.width, sender: sender)
    }
}
