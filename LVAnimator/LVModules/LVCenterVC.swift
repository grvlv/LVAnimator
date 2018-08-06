//
//  LVCenterVC.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/3.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVCenterVC: LVBaseViewController {
    
    let backBtn = UIButton()
    
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
    
    func setupView() {
        view.backgroundColor = .white
        
        backBtn.setImage(UIImage(named: "tab_first_selected"), for: .normal)
        backBtn.addTarget(self, action: #selector(LVCenterVC.back), for: .touchUpInside)
        view.addSubview(backBtn)
        setupConstraints()
    }
    
    func setupConstraints() {
        backBtn.snp.makeConstraints { (make) in
            make.size.equalTo(44)
            make.top.equalTo(Top_X_S_H)
            make.left.equalTo(6)
        }
    }
    
    @objc func back() {
        dismiss(animated: true)
    }
}
