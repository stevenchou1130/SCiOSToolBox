//
//  UITableView+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import UIKit

// MARK: -
public extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseCellID, for: indexPath) as? T else {
            fatalError("Unable to dequeue reusable cell - \(T.reuseCellID)")
        }
        
        return cell
    }
}

// MARK: -
public extension UITableViewCell {
    
    static var reuseCellID: String {
        return String(describing: self)
    }
}

