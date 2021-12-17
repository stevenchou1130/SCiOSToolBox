//
//  UILabel+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import UIKit

public extension UILabel {

    var greatestFiniteMagnitudeWidth: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: CGFloat.greatestFiniteMagnitude, height: self.frame.height))
        label.numberOfLines = 0
        label.font = self.font
        label.text = self.text
        label.sizeToFit()
        return label.frame.width
    }

    var greatestFiniteMagnitudeHeight: CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.font = self.font
        label.text = self.text
        label.sizeToFit()
        return label.frame.height
    }

    // Reference: https://stackoverflow.com/questions/5494498/how-to-control-the-line-spacing-in-uilabel
    // lineHeightMultiple = 2 will insert 2 "\n"
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }

    func setCharacterSpacing(characterSpacing: CGFloat = 0.0) {

        guard let labelText = self.text else { return }

        let attributedString: NSMutableAttributedString
        if let labelAttributedText = attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        // Character spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }

    // Label must set text first
    func setDesignatedTextColor(designatedText: String, color: UIColor) {

        guard let labelText = self.text else { return }

        let str: NSString = labelText as NSString
        let range = str.range(of: designatedText)
        let attribute = NSMutableAttributedString.init(string: labelText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        self.attributedText = attribute
    }
}
