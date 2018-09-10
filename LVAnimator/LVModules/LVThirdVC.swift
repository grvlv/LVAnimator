//
//  LVThirdVC.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/3.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVThirdVC: LVBaseViewController {
    
    let animator = LVAnimator()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "Third"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAnimator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem?.isEnabled = true
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "tab_mine_selected"), style: .plain, target: self, action: #selector(LVThirdVC.enterMine))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tab_third_selected"), style: .plain, target: self, action: #selector(LVThirdVC.enterDetail))
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(panGestureVC: self, transitionAction: {
            weakSelf?.enterMine()
        }) { (fromVC, toVC, operation) -> Dictionary<String, Any>? in
            if toVC is LVSettingVC {
                return nil
            }
            switch operation {
            case .present:
                if toVC is LVThirdDetailVC {
                    return ["duration" : "0.4", "delegate" : LVThirdDetailPresentAnimation()]
                } else if toVC is LVMineVC {
                    return ["duration" : "0.4", "delegate" : LVMinePresentAnimation()]
                }
            default: break
            }
            return nil
        }
    }
    
    @objc func enterDetail() {
        navigationItem.leftBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItem?.isEnabled = false
        let vc = LVThirdDetailVC()
        animator.registerDelegate(vc: vc)
        present(vc, animated: true)
    }
    
    @objc func enterMine() {
        let vc = LVMineVC()
        animator.registerDelegate(vc: vc)
        present(vc, animated: true)
    }
}
