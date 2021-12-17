//
//  SCButtonFactory.swift
//  SCiOSToolbox
//
//  Created by Steven on 2020/12/30.
//

import UIKit

@objcMembers public class SCButtonFactory {
    
    // MARK: - Property

    // MARK: - UI Content
    
    // MARK: - Initialization
    public init() {
        
    }
    
    public required init?(coder: NSCoder) {
        fatalError("\(Self.self) init(coder:) has not been implemented")
    }
}

// MARK: - Public
public extension SCButtonFactory {
 
    class func createButton(with title: String) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }
}

// MARK: - Private
public extension SCButtonFactory {
    
}
