//
//  LVMinePresentAnimation.swift
//  LVAnimation
//
//  Created by GRV on 2018/7/16.
//  Copyright © 2018年 GRV. All rights reserved.
//

import Foundation
import UIKit

class LVMinePresentAnimation: NSObject, LVTransitionAnimationDelegate {
    
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let toVC = transitionContext.viewController(forKey: .to) as? LVMineVC else {
            return
        }
        
        let contentView = transitionContext.containerView
        contentView.addSubview(toVC.view)
        contentView.addSubview(fromVC.view)
        
        let view = LVMaskView()
        view.frame = fromVC.view.bounds
        view.vc = toVC
        view.tag = 100
        fromVC.view.addSubview(view)
        let labelFinalFrame = toVC.label.frame
        let btnFinalFrame = toVC.backBtn.frame
        toVC.label.frame.origin.x += 50
        toVC.label.frame.origin.y -= 20
        toVC.backBtn.frame.origin.x += 50
        toVC.backBtn.frame.origin.y += 20
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                toVC.view.frame.size.width = Screen_W - 50
                fromVC.view.frame.origin.x = toVC.view.frame.width
                toVC.label.frame = labelFinalFrame
                toVC.backBtn.frame = btnFinalFrame
                view.alpha = 0.8
            })
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            if !transitionContext.transitionWasCancelled {
                contentView.addSubview(fromVC.view)
            } else {
                view.removeFromSuperview()
            }
        }
    }
}
