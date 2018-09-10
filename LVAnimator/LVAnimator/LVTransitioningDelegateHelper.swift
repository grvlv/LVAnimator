//
//  LVTransitioningDelegateHelper.swift
//  LVAnimator
//
//  Created by GRV on 2018/6/28.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

@objc enum TransitionOperation: Int {
    case push
    case pop
    case present
    case dismiss
}

class LVTransitioningDelegateHelper: NSObject, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate {
    
    weak var vc: UIViewController?
    var progress: CGFloat = 0
    var rate: CGFloat = 1 / 60
    var isReverse = false
    var transitionAction: (() -> ())?
    var animationBlock: ((_ fromVC: UIViewController?, _ toVC: UIViewController?, _ operation: TransitionOperation) -> Dictionary<String, Any>?)?
    var link: CADisplayLink?
    var edgePan: UIScreenEdgePanGestureRecognizer?
    var interactive: UIPercentDrivenInteractiveTransition?
    
    func startLink() {
        if link == nil {
            link = CADisplayLink(target: self, selector: #selector(LVTransitioningDelegateHelper.linkUpdate))
            link?.add(to: RunLoop.current, forMode: .commonModes)
        }
    }
    
    func stopLink() {
        link?.invalidate()
        link = nil
    }
    
    @objc func linkUpdate() {
        progress += rate
        if progress >= 0.98 {
            stopLink()
            interactive?.finish()
            interactive = nil
        } else {
            interactive?.update(progress)
        }
    }
    
    func addGestureForViewController(viewController: UIViewController) {
        vc = viewController
        if vc != nil, edgePan == nil {
            edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(panGesture(pan:)))
            edgePan!.edges = .left
            vc?.view.addGestureRecognizer(edgePan!)
        }
    }
    
    @objc func panGesture(pan: UIPanGestureRecognizer) {
        guard let view = vc?.view else {
            return
        }
        progress = pan.translation(in: view).x / view.bounds.width
        progress = isReverse ? -progress : progress
        switch pan.state {
        case .began:
            if let action = transitionAction {
                interactive = UIPercentDrivenInteractiveTransition()
                action()
            }
        case .changed:
            interactive?.update(progress)
        case .cancelled, .ended:
            if progress > 0.4 {
                startLink()
            } else {
                interactive?.cancel()
                interactive = nil
            }
        default: break
        }
    }
    
    func transitionConfig(config: Dictionary<String, Any>) -> LVTransitionAnimation {
        let transition = LVTransitionAnimation()
        if let durationStr = config["duration"] as? String {
            if let duration = TimeInterval(durationStr) {
                transition.duration = duration
            }
        }
        if let delegate = config["delegate"] as? LVTransitionAnimationDelegate {
            transition.delegate = delegate
        }
        return transition
    }
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        var o = TransitionOperation.push
        switch operation {
        case .push:
            o = .push
        case .pop:
            o = .pop
        default: return nil
        }
        if let block = animationBlock {
            if let config = block(fromVC, toVC, o) {
                return transitionConfig(config: config)
            }
        }
        return nil
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let block = animationBlock {
            if let config = block(presenting, presented, .present) {
                return transitionConfig(config: config)
            }
        }
        return nil
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if let block = animationBlock {
            if let config = block(dismissed, nil, .dismiss) {
                return transitionConfig(config: config)
            }
        }
        return nil
    }
    
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactive
    }
}
