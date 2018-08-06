//
//  LVMaskView.swift
//  LVAnimator
//
//  Created by GRV on 2018/6/27.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVMaskView: UIView {
    
    var vc: UIViewController? {
        didSet {
            if let mine = vc as? LVMineVC {
                mine.animator.helper.vc = mine
                mine.animator.helper.isReverse = true
            } else if let secondDetail = vc as? LVSecondDetailVC {
                secondDetail.animator.helper.vc = secondDetail
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: CGRect())
        backgroundColor = .clear
        alpha = 0
        let tap = UITapGestureRecognizer(target: self, action: #selector(LVMaskView.tap))
        addGestureRecognizer(tap)
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(LVMaskView.pan))
        addGestureRecognizer(pan)
    }
    
    @objc func tap() {
        vc?.dismiss(animated: true, completion: nil)
    }
    
    @objc func pan(gesture: UIPanGestureRecognizer) {
        if let mine = vc as? LVMineVC {
            mine.animator.helper.panGesture(pan: gesture)
        } else if let secondDetail = vc as? LVSecondDetailVC {
            secondDetail.animator.helper.panGesture(pan: gesture)
        }
    }
}
