//
//  LVThirdDetailDismissAnimation.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import Foundation
import UIKit

class LVThirdDetailDismissAnimation: NSObject, LVTransitionAnimationDelegate {
    
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? LVThirdDetailVC else {
            return
        }
        guard let toVC = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let contentView = transitionContext.containerView
        contentView.addSubview(toVC.view)
        contentView.addSubview(fromVC.view)
        let height = fromVC.whiteBoard.frame.height
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: {
                fromVC.bg.alpha = 0
                fromVC.whiteBoard.alpha = 0
                fromVC.whiteBoard.snp.remakeConstraints { (make) in
                    make.height.equalTo(height)
                    make.top.equalTo(fromVC.view.snp.bottom)
                    make.left.right.equalToSuperview()
                }
                fromVC.view.layoutIfNeeded()
            })
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
