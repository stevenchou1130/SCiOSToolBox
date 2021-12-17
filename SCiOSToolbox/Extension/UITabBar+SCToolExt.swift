//
//  UITabBar+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import UIKit

// MARK: - Badge
public extension UITabBar {

    func addBadge(isNumber: Bool, number: Int, index tabBarItemIndex: Int) {

        guard let tabBarItems = self.items else {
            return;
        }

        if (tabBarItemIndex >= tabBarItems.count) {
            return
        }

        let tabBarItem = tabBarItems[tabBarItemIndex]

        if (isNumber) {
            tabBarItem.badgeValue = String(number)
        } else {
            tabBarItem.badgeValue = "●"
            tabBarItem.badgeColor = .clear
            tabBarItem.setBadgeTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
        }
    }

    func removeBadge(index tabBarItemIndex: Int) {

        guard let tabBarItems = self.items else {
            return;
        }

        if (tabBarItemIndex >= tabBarItems.count) {
            return
        }

        let tabBarItem = tabBarItems[tabBarItemIndex]
        tabBarItem.badgeValue = nil
    }
}

