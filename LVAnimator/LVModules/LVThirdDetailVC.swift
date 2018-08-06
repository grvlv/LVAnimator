//
//  LVThirdDetailVC.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVThirdDetailVC: LVBaseViewController {
    
    let bg = UIView()
    let whiteBoard = LVThirdDetailView()
    let animator = LVAnimator()
    var data = [LVThirdDetailSectionModel(), LVThirdDetailSectionModel(), LVThirdDetailSectionModel()]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animator.registerDelegate(vc: self)
    }
    
    func setupView() {
        view.backgroundColor = .clear
        bg.backgroundColor = .lvBlack2
        bg.alpha = 0.61
        view.addSubview(bg)
        
        weak var weakSelf = self
        whiteBoard.cancelAction = {
            weakSelf?.back()
        }
        whiteBoard.title.text = "GRV_Lv"
        view.addSubview(whiteBoard)
        
        setupData()
        setupAnimator()
        setupConstraints()
        whiteBoard.reloadData(newData: data)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LVThirdDetailVC.back))
        bg.addGestureRecognizer(tap)
    }
    
    func setupData() {
        for (index, sectionModel) in data.enumerated() {
            switch index {
            case 0:
                sectionModel.title = "分享至"
                sectionModel.cellModels = [setupCellModel(type: .weibo),
                                           setupCellModel(type: .qzone),
                                           setupCellModel(type: .qq),
                                           setupCellModel(type: .wechat),
                                           setupCellModel(type: .pengyouquan),
                                           setupCellModel(type: .copyurl),
                                           setupCellModel(type: .weibo),
                                           setupCellModel(type: .qzone),
                                           setupCellModel(type: .qq),
                                           setupCellModel(type: .wechat),
                                           setupCellModel(type: .pengyouquan),
                                           setupCellModel(type: .copyurl)]
            case 1:
                sectionModel.title = "快速创建"
                sectionModel.cellModels = [setupCellModel(type: .card),
                                           setupCellModel(type: .rule),
                                           setupCellModel(type: .message)]
            case 2:
                sectionModel.title = "标记为"
                sectionModel.cellModels = [setupCellModel(type: .white),
                                           setupCellModel(type: .blue),
                                           setupCellModel(type: .orange),
                                           setupCellModel(type: .green),
                                           setupCellModel(type: .red)]
            default: break
            }
        }
    }
    
    func setupCellModel(type: LVThirdDetailCellType) -> LVThirdDetailCellModel {
        let model = LVThirdDetailCellModel()
        model.analysisType(type: type)
        return model
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(vc: self, transitionAction: {
            weakSelf?.back()
        }) { (fromVC, toVC, operation) -> ((duration: TimeInterval, delegate: LVTransitionAnimationDelegate)?) in
            switch operation {
            case .dismiss:
                return (0.4, LVThirdDetailDismissAnimation())
            default: break
            }
            return nil
        }
    }
    
    func setupConstraints() {
        bg.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        whiteBoard.snp.remakeConstraints { (make) in
            make.height.equalTo(415 + Bottom_X_H)
            make.left.right.bottom.equalToSuperview()
        }
        view.layoutIfNeeded()
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
}
