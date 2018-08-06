//
//  LVFirstDetailPopAnimation.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import Foundation
import UIKit

class LVFirstDetailPopAnimation: NSObject, LVTransitionAnimationDelegate {
    
    func animateAction(transitionContext: UIViewControllerContextTransitioning, duration: TimeInterval) {
        guard let fromVC = transitionContext.viewController(forKey: .from) as? LVFirstDetailVC else {
            return
        }
        guard let toVC = transitionContext.viewController(forKey: .to) as? LVFirstVC else {
            return
        }
        
        transitionContext.containerView.addSubview(toVC.view)
        transitionContext.containerView.addSubview(fromVC.view)
        let frame = fromVC.label.frame
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            fromVC.imageView.frame = toVC.imageView.frame
            fromVC.imageView.layer.cornerRadius = toVC.imageView.layer.cornerRadius
            fromVC.label.frame = CGRect(x: frame.origin.x, y: frame.origin.y - frame.size.height - 40, width: frame.size.width, height: frame.size.height)
            fromVC.label.alpha = 0
            toVC.navigationController?.setNavigationBarHidden(false, animated: true)
            if let tabBarRect = toVC.tabBarController?.tabBar.frame {
                toVC.tabBarController?.tabBar.frame = CGRect(x: tabBarRect.origin.x, y: tabBarRect.origin.y - tabBarRect.size.height, width: tabBarRect.size.width, height: tabBarRect.size.height)
            }
            toVC.tabBarController?.tabBar.alpha = 1
        }) { (finished) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
