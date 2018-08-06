//
//  LVFirstDetailVC.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVFirstDetailVC: LVBaseViewController {
    
    let backBtn = UIButton()
    let imageView = UIImageView()
    let label = UILabel()
    let animator = LVAnimator()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "FirstDetail"
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
    
    func setupView () {
        view.backgroundColor = .white
        
        label.text = "有毒的草开迷人的花\n伤你的人说爱你的话"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        label.numberOfLines = 0
        label.frame = CGRect(x: 30, y: 320, width: UIScreen.main.bounds.width - 60, height: 80)
        view.addSubview(label)
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Image")
        view.addSubview(imageView)
        
        backBtn.setImage(UIImage(named: "tab_first_selected"), for: .normal)
        backBtn.addTarget(self, action: #selector(LVFirstDetailVC.back), for: .touchUpInside)
        view.addSubview(backBtn)
        setupConstraints()
    }
    
    func setupAnimator() {
        weak var weakSelf = self
        animator.setup(vc: self, openEdgePan: true, transitionAction: {
            weakSelf?.back()
        }) { (fromVC, toVC, operation) -> ((duration: TimeInterval, delegate: LVTransitionAnimationDelegate)?) in
            switch operation {
            case .pop:
                return (1, LVFirstDetailPopAnimation())
            default: break
            }
            return nil
        }
    }
    
    func setupConstraints() {
        backBtn.snp.makeConstraints { (make) in
            make.size.equalTo(44)
            make.top.equalTo(Top_X_S_H)
            make.left.equalTo(6)
        }
    }
    
    @objc func back() {
        navigationController?.popViewController(animated: true)
    }
}
