//
//  LVBaseViewController.swift
//  LVBase
//
//  Created by GRV on 2018/6/15.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit
import SnapKit

class LVBaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let contentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contentView)
        contentView.snp.remakeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
