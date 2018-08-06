//
//  LVFirstDetailPushAnimation.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import Foundation
import UIKit

class LVFirstDetailPushAnimation: NSObject, LVTransitionAnimationDelegate {
    
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? LVFirstVC else {
            return
        }
        guard let toVC = transitionContext.viewController(forKey: .to) as? LVFirstDetailVC else {
            return
        }
        
        transitionContext.containerView.addSubview(toVC.view)
        toVC.imageView.frame = fromVC.imageView.frame
        toVC.imageView.layer.cornerRadius = fromVC.imageView.layer.cornerRadius
        toVC.backBtn.alpha = 0
        toVC.label.alpha = 0
        
        let imageFrame = toVC.imageView.frame
        let labelFrame = toVC.label.frame
        UIView.animateKeyframes(withDuration: duration, delay: 0, options: .calculationModeCubic, animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3, animations: {
                toVC.imageView.frame = CGRect(x: imageFrame.origin.x, y: imageFrame.origin.y + 10, width: imageFrame.size.width, height: imageFrame.size.height)
                toVC.imageView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                toVC.navigationController?.setNavigationBarHidden(true, animated: true)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.7, animations: {
                toVC.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 400)
                toVC.imageView.layer.cornerRadius = 0
                toVC.label.frame = CGRect(x: labelFrame.origin.x, y: labelFrame.origin.y + labelFrame.size.height + 40, width: labelFrame.size.width, height: labelFrame.size.height)
                toVC.label.alpha = 1
                toVC.backBtn.alpha = 1
                if let tabBarRect = toVC.tabBarController?.tabBar.frame {
                    toVC.tabBarController?.tabBar.frame = CGRect(x: tabBarRect.origin.x, y: tabBarRect.origin.y + tabBarRect.size.height, width: tabBarRect.size.width, height: tabBarRect.size.height)
                }
                toVC.tabBarController?.tabBar.alpha = 0
            })
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
