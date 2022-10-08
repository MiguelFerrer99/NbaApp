//
//  UINavigationController+Extension.swift
//  NbaApp
//
//  Created by Miguel Ferrer Fornali on 8/10/22.
//

import UIKit

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1 && !isNavigationBarHidden
    }
}
