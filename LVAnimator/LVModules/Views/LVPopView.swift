//
//  LVPopView.swift
//  LVAnimator
//
//  Created by GRV on 2018/8/6.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVPopView: UIView {
    
    let beginPath = UIBezierPath()
    let trianglePath = UIBezierPath()
    let triangle = CAShapeLayer()
    let bg = UIView()
    let label = UILabel()
    var point = CGPoint.zero
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(frame: UIScreen.main.bounds)
        setupView()
    }
    
    func show(text: String, width: CGFloat? = Screen_W, sender: UIView? = nil) {
        let window = UIApplication.shared.keyWindow
        window?.addSubview(self)
        
        label.text = text
        setupConstraints(width: width! - 32, sender: sender)
        bgAnimation(isShow: true)
        triangleAnimation(isShow: true)
    }
    
    func setupView() {
        bg.alpha = 0
        bg.backgroundColor = .lvBlack1A6
        bg.layer.cornerRadius = 2
        addSubview(bg)
        
        label.font = .lvPFM10()
        label.textColor = .lvWhite1
        label.numberOfLines = 0
        bg.addSubview(label)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(LVPopView.hide))
        addGestureRecognizer(tap)
    }
    
    func setupConstraints(width: CGFloat, sender: UIView?) {
        if let v = sender {
            if let rect = v.superview?.convert(v.frame, to: self) {
                point = CGPoint(x: rect.origin.x + rect.size.width / 2, y: rect.origin.y + rect.size.height + 2)
                bg.snp.remakeConstraints { (make) in
                    make.left.equalTo(point.x).priority(.low)
                    make.right.equalToSuperview().offset(-16)
                    make.top.equalTo(point.y + 8)
                }
                setupTriangle()
            } else {
                bg.snp.remakeConstraints { (make) in
                    make.center.equalToSuperview()
                }
            }
        }
        
        label.snp.remakeConstraints { (make) in
            make.width.lessThanOrEqualTo(width - 10)
            make.edges.equalTo(bg).inset(UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
            make.center.equalToSuperview()
        }
    }
    
    func setupTriangle() {
        layoutIfNeeded()
        
        trianglePath.move(to: CGPoint.init(x: point.x - 3, y: point.y))
        trianglePath.addLine(to: CGPoint.init(x: point.x + 3, y: point.y))
        trianglePath.addLine(to: CGPoint.init(x: point.x, y: point.y - 6))
        trianglePath.close()
        
        var beginPoint = point
        beginPoint.x += 8
        beginPoint.y += 8
        beginPath.move(to: CGPoint.init(x: beginPoint.x - 3, y: beginPoint.y))
        beginPath.addLine(to: CGPoint.init(x: beginPoint.x + 3, y: beginPoint.y))
        beginPath.addLine(to: CGPoint.init(x: beginPoint.x, y: beginPoint.y))
        beginPath.close()
        
        triangle.fillColor = UIColor.lvBlack1A6.cgColor
        triangle.path = trianglePath.cgPath
        layer.addSublayer(triangle)
    }
    
    func bgAnimation(isShow: Bool) {
        layoutIfNeeded()
        UIView.animate(withDuration: 0.4, delay: 0, options: .beginFromCurrentState, animations: {
            self.bg.alpha = isShow ? 1 : 0
            self.bg.snp.updateConstraints({ (make) in
                make.top.equalTo(self.point.y)
            })
            self.layoutIfNeeded()
        }) { (isFinished) in
            if !isShow {
                self.removeFromSuperview()
            }
        }
    }
    
    func triangleAnimation(isShow: Bool) {
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = isShow ? 0 : 1
        opacityAnimation.toValue = isShow ? 1 : 0
        opacityAnimation.duration = 0.4
        opacityAnimation.isRemovedOnCompletion = false
        opacityAnimation.fillMode = kCAFillModeForwards
        triangle.add(opacityAnimation, forKey: "opacity")
        
        if isShow {
            let pathAnimation = CABasicAnimation(keyPath: "path")
            pathAnimation.fromValue = beginPath.cgPath
            pathAnimation.toValue = trianglePath.cgPath
            pathAnimation.duration = 0.4
            pathAnimation.isRemovedOnCompletion = false
            pathAnimation.fillMode = kCAFillModeForwards
            triangle.add(pathAnimation, forKey: "path")
        }
    }
    
    @objc func hide() {
        bgAnimation(isShow: false)
        triangleAnimation(isShow: false)
    }
}
