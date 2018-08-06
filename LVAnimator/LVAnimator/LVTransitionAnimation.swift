//
//  LVTransitionAnimation.swift
//  LVAnimator
//
//  Created by GRV on 2018/6/28.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

protocol LVTransitionAnimationDelegate {
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval)
}

class LVTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    var duration: TimeInterval = 1
    var delegate: LVTransitionAnimationDelegate?
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        delegate?.animateAction(transitionContext: transitionContext, duration: duration)
    }
}
