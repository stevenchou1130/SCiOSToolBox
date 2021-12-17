//
//  UIScreen+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import UIKit

public extension UIScreen {

    var resolution: CGFloat {
        return self.bounds.height / self.bounds.width
    }
}
