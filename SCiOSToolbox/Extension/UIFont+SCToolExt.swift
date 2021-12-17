//
//  UIFont+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import UIKit

public extension UIFont {

    @nonobjc class func font(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }

    @nonobjc class func fontBold(_ size: CGFloat) -> UIFont {
        return UIFont.boldSystemFont(ofSize: size)
    }

    @nonobjc class func fontMedium(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .medium)
    }

    @nonobjc class func fontSemibold(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }

    @nonobjc class func fontHeavy(_ size: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .heavy)
    }
}
