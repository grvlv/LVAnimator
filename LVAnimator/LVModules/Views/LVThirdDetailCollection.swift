//
//  LVThirdDetailCollection.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVThirdDetailCollection: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let title = UILabel()
    let separator = UIView()
    let selectBg = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: 26))
    let layout = UICollectionViewFlowLayout()
    var collection: UICollectionView?
    var data: [LVThirdDetailCellModel]?
    var section = -1
    var selectedItem: ((_ indexPath: IndexPath) -> ())?
    var y = 38
    var x = 25
    var xPadding = 58
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect())
    }
    
    func setup() {
        setupSelectBg()
        setupTitle()
        setupCollection()
        setupSeparator()
        setupConstraints()
    }
    
    func setupSelectBg() {
        selectBg.isHidden = true
        selectBg.backgroundColor = .lvGray3A1
        selectBg.layer.borderColor = UIColor.lvGray3.cgColor
        selectBg.layer.borderWidth = 1
        selectBg.layer.cornerRadius = 13
        addSubview(selectBg)
    }
    
    func setupTitle() {
        title.font = .lvPFM12()
        title.textColor = .lvBlack2
        addSubview(title)
    }
    
    func setupCollection() {
        collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection?.backgroundColor = .clear
        collection?.delegate = self
        collection?.dataSource = self
        collection?.showsHorizontalScrollIndicator = false
        collection?.showsVerticalScrollIndicator = false
        collection?.register(LVThirdDetailCell.self, forCellWithReuseIdentifier: "LVThirdDetailCell")
        addSubview(collection!)
    }
    
    func setupSeparator() {
        separator.backgroundColor = .dcWhite2
        addSubview(separator)
    }
    
    func setupConstraints() {
        title.snp.remakeConstraints { (make) in
            make.left.equalTo(16)
            make.top.equalTo(section == 0 ? 6 : 14)
        }
        
        collection?.snp.remakeConstraints({ (make) in
            make.height.equalTo(layout.estimatedItemSize.height)
            make.left.right.equalToSuperview()
            make.top.equalTo(title.snp.bottom).offset(10)
        })
        
        separator.snp.remakeConstraints { (make) in
            make.height.equalTo(2)
            make.top.equalTo(collection?.snp.bottom ?? 0).offset(16)
            make.left.right.bottom.equalToSuperview()
        }
    }
    
    func reloadData(newData: LVThirdDetailSectionModel) {
        title.text = newData.title
        data = newData.cellModels
        collection?.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LVThirdDetailCell", for: indexPath) as! LVThirdDetailCell
        if let model = data?[indexPath.row] {
            cell.setupData(data: model)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let block = selectedItem {
            let selectIndexPath = IndexPath(row: indexPath.row, section: section)
            block(selectIndexPath)
            if section == 2 {
                selectMoveToIndex(index: indexPath.row)
            }
        }
    }
    
    func selectMoveToIndex(index: Int) {
        if selectBg.isHidden {
            selectBg.isHidden = false
        }
        let point = CGPoint(x: x + xPadding * index, y: y)
        let distance = fabs(selectBg.frame.origin.x - point.x)
        let time = distance * 0.001 + 0.5
        selectBg.alpha = 0.2
        UIView.animate(withDuration: TimeInterval(time), delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.selectBg.frame.origin = point
        }) { (isFinished) in
            UIView.animate(withDuration: 0.2, delay: 0, options: .beginFromCurrentState, animations: {
                self.selectBg.alpha = 1
            })
        }
    }
}
