//
//  UIView+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import UIKit

@objc public extension UIView {
    
    // MARK: Gradient layer
    // Must call them after view init (viewDidLayoutSubviews)
    func setLeftToRightGradientLayer(alpha: CGFloat = 1.0) {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = [UIColor(r: 255, g: 135, b: 97, a: alpha).cgColor,
                        UIColor(r: 247, g: 100, b: 140, a: alpha).cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.addSublayer(layer)
    }
    
    func setLeftToRightGradientLayer(color1: UIColor, color2: UIColor) {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = [color1.cgColor,
                        color2.cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        self.layer.addSublayer(layer)
    }
    
    func setTopToBottomGradientLayer(color1: UIColor, color2: UIColor) {
        let layer = CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = [color1.cgColor,
                        color2.cgColor]
        layer.startPoint = CGPoint(x: 0.5, y: 0)
        layer.endPoint = CGPoint(x: 0.5, y: 1)
        self.layer.addSublayer(layer)
    }
    
    // MARK: Border and shadow
    func addBorderAndShadow(borderColor: UIColor,
                            shadowColor: UIColor?,
                            borderWidth: CGFloat,
                            cornerRadius: CGFloat,
                            blur: CGFloat,
                            offset: CGSize = CGSize(width: 0, height: 1.0),
                            opacity: Float = 0.5) {
        
        self.addBorder(color: borderColor, borderWidth: borderWidth, cornerRadius: cornerRadius)
        
        if let shadowColor = shadowColor {
            // Use specific shadow color
            self.addShadow(color: shadowColor,
                           cornerRadius: cornerRadius,
                           blur: blur,
                           offset: offset,
                           opacity: opacity)
        } else {
            // Use same color as border
            self.addShadow(color: borderColor,
                           cornerRadius: cornerRadius,
                           blur: blur,
                           offset: offset,
                           opacity: opacity)
        }
    }
    
    func addBorder(color: UIColor,
                   borderWidth: CGFloat,
                   cornerRadius: CGFloat) {
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
    }
    
    func addShadow(color: UIColor,
                   cornerRadius: CGFloat,
                   blur: CGFloat = 2,
                   offset: CGSize = CGSize(width: 0, height: 1.0),
                   opacity: Float = 0.5) {
        
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = blur
        self.layer.shadowOpacity = opacity
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
        self.layer.cornerRadius = cornerRadius
    }
}
