//
//  LVSecondDetailView.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import Foundation
import UIKit

protocol LVSecondDetailViewDelegate: NSObjectProtocol {
    func confirmPressed()
}

class LVSecondDetailView: UIView {
    
    let resetBtn = UIButton()
    let confirmBtn = UIButton()
    var cells = [LVSecondDetailCellContent]()
    var data: [LVSecondDetailSectionModel]?
    weak var delegate: LVSecondDetailViewDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect())
        
        setupShadow()
        setupCells()
        setupBottom()
        setupConstraints()
    }
    
    func setupShadow() {
        backgroundColor = .dcWhite2
        layer.shadowOffset = CGSize(width: -3, height: -1)
        layer.shadowColor = UIColor.lvBlack1.cgColor
        layer.shadowRadius = 2
        layer.shadowOpacity = 0.2
    }
    
    func setupCells() {
        for i in 0..<4 {
            let cell = LVSecondDetailCellContent()
            cell.section = i
            cell.headerHeight = i == 0 ? 51 + Top_X_H : 47
            if i + 1 >= 4 {
                cell.footerHeight = 78
            }
            addSubview(cell)
            cells.append(cell)
        }
    }
    
    func setupBottom() {
        resetBtn.setTitle("重置", for: .normal)
        resetBtn.setTitleColor(.lvBlue1, for: .normal)
        resetBtn.backgroundColor = .lvWhite1
        resetBtn.addTarget(self, action: #selector(LVSecondDetailView.resetPressed), for: .touchUpInside)
        addSubview(resetBtn)
        
        confirmBtn.setTitle("确定", for: .normal)
        confirmBtn.setTitleColor(.lvWhite1, for: .normal)
        confirmBtn.backgroundColor = .lvBlue1
        confirmBtn.addTarget(self, action: #selector(LVSecondDetailView.confirmPressed), for: .touchUpInside)
        addSubview(confirmBtn)
    }
    
    func setupConstraints() {
        resetBtn.snp.remakeConstraints { (make) in
            make.height.equalTo(48)
            make.width.equalToSuperview().dividedBy(2)
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-Bottom_X_H)
        }
        
        confirmBtn.snp.remakeConstraints { (make) in
            make.size.equalTo(resetBtn)
            make.right.equalToSuperview()
            make.bottom.equalTo(resetBtn)
        }
        
        var temp: UIView?
        for (index, cell) in cells.enumerated() {
            cell.snp.remakeConstraints { (make) in
                make.left.right.equalToSuperview()
                if index == 0 {
                    make.top.equalToSuperview()
                } else if index == 1 {
                    make.top.equalTo(temp?.snp.bottom ?? 0).offset(-20)
                } else {
                    make.top.equalTo(temp?.snp.bottom ?? 0).offset(6)
                }
            }
            temp = cell
        }
    }
    
    func reloadData(newData: [LVSecondDetailSectionModel]) {
        data = newData
        if let arr = data {
            for (index, model) in arr.enumerated() {
                let cell = cells[index]
                cell.setupData(data: model)
            }
        }
    }
    
    @objc func resetPressed() {
        if let sectionModels = data {
            for (section, sectionModel) in sectionModels.enumerated() {
                let cell = cells[section]
                if let rowModels = sectionModel.cellModel {
                    for (row, rowModel) in rowModels.enumerated() {
                        rowModel.isSelected = false
                        cell.cells[row].setupSelection()
                    }
                }
            }
        }
    }
    
    @objc func confirmPressed() {
        if let del = delegate {
            del.confirmPressed()
        }
    }
}
