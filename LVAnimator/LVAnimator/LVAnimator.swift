//
//  LVAnimator.swift
//  LVAnimator
//
//  Created by GRV on 2018/6/28.
//  Copyright © 2018年 GRV. All rights reserved.
//

import Foundation
import UIKit

class LVAnimator: NSObject {
    
    lazy var helper = LVTransitioningDelegateHelper()
    
    func setup(vc: UIViewController, openEdgePan: Bool? = false, transitionAction: (() -> ())? = nil, animationAction: ((_ fromVC: UIViewController?, _ toVC: UIViewController?, _ operation: TransitionOperation) -> ((duration: TimeInterval, delegate: LVTransitionAnimationDelegate)?))? = nil) {
        if openEdgePan! {
            helper.openEdgePan = openEdgePan!
            helper.addGestureForViewController(viewController: vc)
        }
        helper.transitionAction = transitionAction
        helper.animationBlock = animationAction
    }
    
    func registerDelegate(vc: UIViewController) {
        vc.transitioningDelegate = helper
        vc.navigationController?.delegate = helper
    }
}
