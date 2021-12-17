//
//  NSMutableAttributedString+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import UIKit

public extension NSMutableAttributedString {

    /**
     Easy to set text's attributes

     ## Reference
     https://stackoverflow.com/questions/27728466/use-multiple-font-colors-in-a-single-label

     ## Usage
     ```
     let firstText = ""
     let secondText = ""
     let stringValue = firstText + secondText

     let attributedString = NSMutableAttributedString(string: stringValue)
     attributedString.setAttributes(textForAttribute: secondText, color: .black, font: .font(12))
     attributedString.setAttributes(textForAttribute: secondText, color: .red, font: .font(24))
     ```
     */
    func setAttributes(textForAttribute: String,
                       color: UIColor? = nil,
                       font: UIFont? = nil) {

        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)

        if let color = color {
            self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }

        if let font = font {
            self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
        }
    }
}
