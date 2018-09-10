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
    
    func setup(animationAction: @escaping (_ fromVC: UIViewController?, _ toVC: UIViewController?, _ operation: TransitionOperation) -> Dictionary<String, Any>?) {
        setupAnimator(animationAction: animationAction)
    }
    
    func setup(panGestureVC: UIViewController, transitionAction: @escaping () -> (), animationAction: @escaping (_ fromVC: UIViewController?, _ toVC: UIViewController?, _ operation: TransitionOperation) -> Dictionary<String, Any>?) {
        setupAnimator(panGestureVC: panGestureVC, transitionAction: transitionAction, animationAction: animationAction)
    }
    
    func setupAnimator(panGestureVC: UIViewController? = nil, transitionAction: (() -> ())? = nil, animationAction: @escaping (_ fromVC: UIViewController?, _ toVC: UIViewController?, _ operation: TransitionOperation) -> (Dictionary<String, Any>?)) {
        if panGestureVC != nil {
            helper.addGestureForViewController(viewController: panGestureVC!)
        }
        helper.transitionAction = transitionAction
        helper.animationBlock = animationAction
    }
    
    func registerDelegate(vc: UIViewController) {
        vc.transitioningDelegate = helper
        vc.navigationController?.delegate = helper
    }
}
