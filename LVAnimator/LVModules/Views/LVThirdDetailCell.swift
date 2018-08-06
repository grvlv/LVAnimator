//
//  LVThirdDetailCell.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit
import Iconic

class LVThirdDetailCell: UICollectionViewCell {
    
    let icon = UIImageView()
    let colorView = UIView()
    let textLabel = UILabel()
    var model: LVThirdDetailCellModel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textLabel.font = .lvPFM12()
        textLabel.textColor = .lvBlack3
        textLabel.textAlignment = .center
        contentView.addSubview(textLabel)
        contentView.addSubview(colorView)
        contentView.addSubview(icon)
        setupConstraints()
    }
    
    func setupConstraints() {
        icon.snp.remakeConstraints { (make) in
            make.size.equalTo(44)
            make.top.centerX.equalToSuperview()
        }
        
        colorView.snp.remakeConstraints { (make) in
            make.size.equalTo(14)
            make.bottom.equalTo(textLabel.snp.top).offset(-7)
            make.centerX.equalToSuperview()
        }
        
        textLabel.snp.remakeConstraints { (make) in
            make.bottom.centerX.equalToSuperview()
        }
    }
    
    func setupData(data: Any?) {
        model = data as? LVThirdDetailCellModel
        if let m = model {
            textLabel.text = m.text ?? ""
            if let type = m.cellType {
                let isHiddenColor = checkCellType(type: type)
                icon.isHidden = !isHiddenColor
                colorView.isHidden = isHiddenColor
            }
        }
    }
    
    func checkCellType(type: LVThirdDetailCellType) -> Bool {
        switch type {
        case .white:
            colorView.filterCircle(color: .lvWhite1A3, size: 14)
        case .blue:
            colorView.filterCircle(color: .lvBlue4A8, size: 14)
        case .orange:
            colorView.filterCircle(color: .lvYellow1A8, size: 14)
        case .green:
            colorView.filterCircle(color: .lvGreen1A8, size: 14)
        case .red:
            colorView.filterCircle(color: .lvRed1A8, size: 14)
        default:
            icon.image = UIImage(named: model?.iconPath ?? "")
            return true
        }
        return false
    }
}
