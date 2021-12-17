//
//  UIViewController+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/16.
//

import UIKit

extension UIViewController {

    // Sequence A -> B -> C, From C -> A only once animation
    func dismissAll(animated: Bool, completion: (() -> Void)? = nil) {

        if let optionalWindow = UIApplication.shared.delegate?.window,
           let window = optionalWindow,
           let rootViewController = window.rootViewController,
           let presentedViewController = rootViewController.presentedViewController  {

            if let snapshotView = window.snapshotView(afterScreenUpdates: false) {
                presentedViewController.view.addSubview(snapshotView)
                presentedViewController.modalTransitionStyle = .coverVertical
            }

            if (!self.isBeingDismissed) {
                rootViewController.dismiss(animated: animated, completion: completion)
            }
        }
    }
}
