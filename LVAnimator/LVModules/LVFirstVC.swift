//
//  LVFirstVC.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/3.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVFirstVC: LVBaseViewController {
    
    let imageView = UIImageView()
    let animator = LVAnimator()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "First"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupAnimator()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animator.registerDelegate(vc: self)
        navigationItem.leftBarButtonItem?.isEnabled = true
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "tab_mine_selected"), style: .plain, target: self, action: #selector(LVFirstVC.enterMine))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "tab_third_selected"), style: .plain, target: self, action: #selector(LVFirstVC.enterDetail))
        
        imageView.image = UIImage(named: "Image")
        imageView.backgroundColor = .lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        setupConstraints()
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(vc: self, openEdgePan: true, transitionAction: {
            weakSelf?.enterMine()
        }) { (fromVC, toVC, operation) -> ((duration: TimeInterval, delegate: LVTransitionAnimationDelegate)?) in
            if toVC is LVSettingVC {
                return nil
            }
            switch operation {
            case .push:
                return (1, LVFirstDetailPushAnimation())
            case .present:
                return (0.4, LVMinePresentAnimation())
            default: break
            }
            return nil
        }
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { (make) in
            make.width.equalTo(300)
            make.height.equalTo(200)
            make.center.equalToSuperview()
        }
    }
    
    @objc func enterDetail() {
        navigationItem.leftBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItem?.isEnabled = false
        navigationController?.pushViewController(LVFirstDetailVC(), animated: true)
    }
    
    @objc func enterMine() {
        let vc = LVMineVC()
        animator.registerDelegate(vc: vc)
        present(vc, animated: true)
    }
}
