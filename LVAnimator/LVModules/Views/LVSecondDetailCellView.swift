//
//  LVSecondDetailCellView.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

protocol LVSecondDetailCellViewDelegate: NSObjectProtocol {
    func cellTapped(index: Int)
}

class LVSecondDetailCellView: UIView {
    
    let bg = UIView()
    let label = UILabel()
    var model: LVSecondDetailCellModel?
    weak var delegte: LVSecondDetailCellViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect())
        let tap = UITapGestureRecognizer(target: self, action: #selector(LVSecondDetailCellView.tapped))
        addGestureRecognizer(tap)
        
        bg.backgroundColor = .lvWhite1
        bg.layer.cornerRadius = 2
        bg.layer.borderWidth = 1
        bg.layer.borderColor = UIColor.lvGray1.cgColor
        addSubview(bg)
        
        label.font = .lvPFR12()
        label.textColor = .lvBlack2
        label.textAlignment = .center
        bg.addSubview(label)
        setupConstraints()
    }
    
    func setupConstraints() {
        bg.snp.remakeConstraints { (make) in
            make.width.greaterThanOrEqualTo(54).priority(800)
            make.width.lessThanOrEqualTo(89).priority(800)
            make.height.equalTo(30).priority(800)
            make.edges.equalToSuperview()
        }
        
        label.snp.remakeConstraints { (make) in
            make.left.greaterThanOrEqualTo(15).priority(.low)
            make.right.greaterThanOrEqualToSuperview().offset(-15).priority(.low)
            make.center.equalToSuperview()
        }
    }
    
    func setupData(data: Any?) {
        model = data as? LVSecondDetailCellModel
        if let m = model {
            label.text = m.text
            setupSelection()
        }
    }
    
    func setupSelection() {
        if let m = model {
            let isSelected = m.isSelected ?? false
            UIView.animate(withDuration: isSelected ? 0.4 : 0.2, delay: 0, options: .beginFromCurrentState, animations: {
                self.bg.backgroundColor = isSelected ? UIColor.lvBlue1A2 : .lvWhite1
                self.bg.layer.borderColor = isSelected ? UIColor.lvBlue3.cgColor : UIColor.lvGray1.cgColor
                self.label.textColor = isSelected ? UIColor.lvBlue1 : .lvBlack2
            })
        }
    }
    
    @objc func tapped() {
        if let del = delegte {
            del.cellTapped(index: tag)
        }
    }
}
