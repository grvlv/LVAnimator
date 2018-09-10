//
//  LVMineVC.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/3.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVMineVC: LVBaseViewController {
    
    let backBtn = UIButton()
    let label = UILabel()
    let animator = LVAnimator()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAnimator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animator.registerDelegate(vc: self)
    }
    
    func setupView() {
        view.backgroundColor = .lightGray
        
        label.text = "设置界面"
        label.font = UIFont.systemFont(ofSize: 20)
        label.frame = CGRect(x: 12, y: UIScreen.main.bounds.height - 50 - CGFloat(Bottom_X_H), width: 200, height: 30)
        label.isUserInteractionEnabled = true
        view.addSubview(label)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LVMineVC.enterSetting))
        label.addGestureRecognizer(tap)
        
        backBtn.frame = CGRect(x: 6, y: Top_X_S_H, width: 44, height: 44)
        backBtn.setImage(UIImage(named: "tab_first_selected"), for: .normal)
        backBtn.addTarget(self, action: #selector(LVMineVC.back), for: .touchUpInside)
        view.addSubview(backBtn)
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(panGestureVC: self, transitionAction: {
            weakSelf?.back()
        }) { (fromVC, toVC, operation) -> Dictionary<String, Any>? in
            return ["duration" : "0.4", "delegate" : LVMineDismissAnimation()]
        }
    }
    
    @objc func enterSetting() {
        if let tabBar = (UIApplication.shared.delegate as? AppDelegate)?.tabBar {
            if let nav = tabBar.childViewControllers[tabBar.selectedIndex] as? UINavigationController {
                let vc = nav.viewControllers.first
                back()
                vc?.navigationController?.pushViewController(LVSettingVC(), animated: true)
            }
        }
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
}
