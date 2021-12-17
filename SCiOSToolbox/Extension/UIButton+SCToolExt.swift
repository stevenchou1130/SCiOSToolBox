//
//  UIButton+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/3/12.
//

import UIKit

public extension UIButton {
    
    func addHighlightAlphaEffect() {
        // TODO
    }
    
    func centerTextAndImage(spacing: CGFloat) {
        let insetAmount = spacing / 2
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: insetAmount)
    }
    
    func alignTextBelow(spacing: CGFloat = 4.0) {
        guard let image = self.imageView?.image else {
            return
        }

        guard let titleLabel = self.titleLabel else {
            return
        }

        guard let titleText = titleLabel.text else {
            return
        }

        let titleSize = titleText.size(withAttributes: [
            NSAttributedString.Key.font: titleLabel.font ?? UIFont.systemFont(ofSize: 12)
        ])

        self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
    }

    func setGap(gap: CGFloat) {
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: -gap / 2, bottom: 0, right: gap / 2)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: gap / 2, bottom: 0, right: -gap / 2)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: gap / 2, bottom: 0, right: gap / 2)
    }
}
