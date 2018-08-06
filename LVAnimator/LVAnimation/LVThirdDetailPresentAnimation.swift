//
//  LVThirdDetailPresentAnimation.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import Foundation
import UIKit

class LVThirdDetailPresentAnimation: NSObject, LVTransitionAnimationDelegate {
    
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval) {
        guard let fromVC = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let toVC = transitionContext.viewController(forKey: .to) as? LVThirdDetailVC else {
            return
        }
        
        let contentView = transitionContext.containerView
        contentView.addSubview(fromVC.view)
        contentView.addSubview(toVC.view)
        
        let height = toVC.whiteBoard.frame.height
        let alpha = toVC.bg.alpha
        toVC.bg.alpha = 0
        toVC.whiteBoard.alpha = 0
        toVC.whiteBoard.snp.remakeConstraints { (make) in
            make.height.equalTo(height)
            make.top.equalTo(toVC.view.snp.bottom)
            make.left.right.equalToSuperview()
        }
        toVC.view.layoutIfNeeded()
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                toVC.bg.alpha = alpha
                toVC.whiteBoard.alpha = 1
                toVC.whiteBoard.snp.remakeConstraints { (make) in
                    make.height.equalTo(height)
                    make.left.right.bottom.equalToSuperview()
                }
                toVC.view.layoutIfNeeded()
            })
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            if !transitionContext.transitionWasCancelled {
                contentView.addSubview(fromVC.view)
                contentView.bringSubview(toFront: toVC.view)
            }
        }
    }
}
