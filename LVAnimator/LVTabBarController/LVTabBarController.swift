//
//  LVTabBarController.swift
//  LVTabBarController
//
//  Created by GRV on 2018/6/21.
//  Copyright © 2018年 GRV. All rights reserved.
//

import UIKit

class LVTabBarController: LVBaseTabBarController, LVTabBarViewDelegate {
    
    let items = [["image" : "tab_first", "selected_image" : "tab_first_selected", "title" : ""],
                 ["image" : "tab_second", "selected_image" : "tab_second_selected", "title" : ""],
                 ["image" : "tab_center", "selected_image" : "tab_center_selected", "title" : ""],
                 ["image" : "tab_third", "selected_image" : "tab_third_selected", "title" : ""],
                 ["image" : "tab_fourth", "selected_image" : "tab_fourth_selected", "title" : ""]]
    let vcs = [LVFirstVC(), LVSecondVC(), UIViewController(), LVThirdVC(), LVFourthVC()]
    let bar = LVTabBar()
    let tabBarView = LVTabBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setValue(bar, forKey: "tabBar")
        viewControllers = vcs.map { (vc) -> UIViewController in
            if vc.isKind(of: LVBaseViewController.self) {
                return LVBaseNavigationController(rootViewController: vc)
            }
            return LVBaseNavigationController()
        }
        tabBarView.delegate = self
        tabBarView.setupItems(arr: items)
        tabBar.addSubview(tabBarView)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tabBarView.frame = bar.bounds
    }
    
    func tabBarSelect(index: Int) {
        if index == 2 {
            centerAction()
            return
        }
        tabBarTransitionAnimation(index: index)
        selectedIndex = index
    }
    
    func tabBarTransitionAnimation(index: Int) {
        if let vc = (viewControllers?[index] as? LVBaseNavigationController)?.topViewController as? LVBaseViewController {
            vc.contentView.alpha = 0
            UIView.animate(withDuration: 0.4) {
                vc.contentView.alpha = 1
            }
        }
    }
    
    func centerAction() {
        present(LVCenterVC(), animated: true)
    }
}
