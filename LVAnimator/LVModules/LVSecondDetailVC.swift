//
//  LVSecondDetailVC.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVSecondDetailVC: LVBaseViewController, LVSecondDetailViewDelegate {
    
    let bg = UIView()
    let detailView = LVSecondDetailView()
    let animator = LVAnimator()
    var data = [LVSecondDetailSectionModel(), LVSecondDetailSectionModel(), LVSecondDetailSectionModel(), LVSecondDetailSectionModel()]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        bg.backgroundColor = .lvBlack2
        bg.alpha = 0.61
        view.addSubview(bg)
        
        setupData()
        detailView.frame = CGRect(x: Screen_W, y: 0, width: Screen_W - 60, height: Screen_H)
        detailView.delegate = self
        view.addSubview(detailView)
        detailView.reloadData(newData: data)
        setupConstraints()
        setupAnimator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animator.registerDelegate(vc: self)
    }
    
    func setupData() {
        var value = 0
        for (index, sectionModel) in data.enumerated() {
            switch index {
            case 0:
                sectionModel.allowsMultiple = false
                sectionModel.title = "创建人身份"
                sectionModel.cellModel = [setupCellModel(text: "我", value: &value), setupCellModel(text: "官方", value: &value), setupCellModel(text: "用户", value: &value)]
            case 1:
                sectionModel.allowsMultiple = false
                sectionModel.title = "活跃状态"
                sectionModel.cellModel = [setupCellModel(text: "活跃", value: &value), setupCellModel(text: "暂停", value: &value)]
            case 2:
                sectionModel.allowsMultiple = false
                sectionModel.title = "公开状态"
                sectionModel.cellModel = [setupCellModel(text: "公开", value: &value), setupCellModel(text: "不公开", value: &value)]
            case 3:
                sectionModel.allowsMultiple = false
                sectionModel.title = "文本/数字"
                sectionModel.iconPath = "icon_info"
                sectionModel.description = "说明文本"
                sectionModel.cellModel = [setupCellModel(text: "包含数字字段", value: &value), setupCellModel(text: "包含文本字段", value: &value)]
            default: break
            }
        }
    }
    
    func setupCellModel(text: String, value: inout Int) -> LVSecondDetailCellModel {
        let model = LVSecondDetailCellModel()
        model.text = text
        model.value = value
        model.isSelected = false
        value += 1
        return model
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(vc: self, transitionAction: {
            weakSelf?.back()
        }) { (fromVC, toVC, operation) -> ((duration: TimeInterval, delegate: LVTransitionAnimationDelegate)?) in
            switch operation {
            case .dismiss:
                return (0.4, LVSecondDetailDismissAnimation())
            default: break
            }
            return nil
        }
    }
    
    func setupConstraints() {
        bg.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        view.layoutIfNeeded()
    }
    
    func confirmPressed() {
        back()
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
}
