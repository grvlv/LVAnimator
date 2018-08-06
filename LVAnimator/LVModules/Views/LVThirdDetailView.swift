//
//  LVThirdDetailView.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVThirdDetailView: UIView {
    
    let title = UILabel()
    let cancel = UIButton()
    let separator = UIView()
    var cancelAction: (() -> ())?
    var data: [LVThirdDetailSectionModel]?
    var collection = [LVThirdDetailCollection]()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .lvWhite1
        
        setupTitle()
        setupSeparator()
        setupCancel()
        setupConstraints()
    }
    
    func setupTitle() {
        title.font = .lvPFM12()
        title.textColor = .lvGray3
        title.textAlignment = .center
        addSubview(title)
    }
    
    func setupSeparator() {
        separator.backgroundColor = .dcWhite2
        addSubview(separator)
    }
    
    func setupCancel() {
        cancel.titleLabel?.font = .lvPFM14()
        cancel.setTitleColor(.lvBlack2, for: .normal)
        cancel.setTitle("取消", for: .normal)
        cancel.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: CGFloat(Bottom_X_H), right: 0)
        cancel.addTarget(self, action: #selector(LVThirdDetailView.cancelPressed), for: .touchUpInside)
        addSubview(cancel)
    }
    
    func setupConstraints() {
        title.snp.remakeConstraints { (make) in
            make.top.equalTo(5)
            make.left.equalTo(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        cancel.snp.remakeConstraints { (make) in
            make.height.equalTo(48 + Bottom_X_H)
            make.left.right.bottom.equalToSuperview()
        }
        
        separator.snp.remakeConstraints { (make) in
            make.height.equalTo(6)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(cancel.snp.top)
        }
    }
    
    func reloadData(newData: [LVThirdDetailSectionModel]) {
        data = newData
        setupCollection()
    }
    
    func setupCollection() {
        if let arr = data {
            var temp: UIView?
            for (index, model) in arr.enumerated() {
                let view = LVThirdDetailCollection()
                var size = CGSize.zero
                if index == 2 {
                    size = CGSize(width: 58, height: 41)
                } else {
                    size = CGSize(width: 58, height: 65)
                }
                view.section = index
                view.layout.sectionInset = UIEdgeInsets(top: 0, left: 9, bottom: 0, right: 9)
                view.layout.estimatedItemSize = size
                view.layout.minimumLineSpacing = 0
                view.layout.minimumInteritemSpacing = 0
                view.layout.scrollDirection = .horizontal
                addSubview(view)
                collection.append(view)
                
                view.snp.remakeConstraints { (make) in
                    if let v = temp {
                        make.top.equalTo(v.snp.bottom)
                    } else {
                        make.top.equalTo(title.snp.bottom)
                    }
                    make.left.right.equalToSuperview()
                }
                temp = view
                view.setup()
                view.reloadData(newData: model)
                view.selectedItem = { (indexPath) in
                    
                }
                
                if index == 2 {
                    view.selectMoveToIndex(index: 0)
                }
            }
        }
    }
    
    @objc func cancelPressed() {
        if let block = cancelAction {
            block()
        }
    }
}
