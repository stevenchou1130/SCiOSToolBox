//
//  UICollectionView+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import UIKit

// MARK: -
public extension UICollectionReusableView {
    
    static var reuseViewID: String {
        return String(describing: self)
    }
}

// MARK: -
public extension UICollectionView {
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseCellID, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable cell - \(T.reuseCellID)")
        }
        
        return cell
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(ofKind kind: String, indexPath: IndexPath) -> T {
        
        guard let view = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.reuseViewID, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable view - \(T.reuseViewID)")
        }
        
        return view
    }
}

// MARK: - 
public extension UICollectionViewCell {
    
    static var reuseCellID: String {
        return String(describing: self)
    }
    
    override func addBorderAndShadow(borderColor: UIColor,
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
    
    override func addBorder(color: UIColor,
                            borderWidth: CGFloat,
                            cornerRadius: CGFloat) {
        
        self.contentView.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = cornerRadius
        self.contentView.layer.borderWidth = borderWidth
        self.contentView.layer.borderColor = color.cgColor
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
    }
    
    override func addShadow(color: UIColor,
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

