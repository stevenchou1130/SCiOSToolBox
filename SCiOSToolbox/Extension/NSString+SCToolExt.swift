//
//  NSString+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import Foundation

@objc public extension NSString {

    var isContainChinese: Bool {
        let r = (self.range(of: "\\p{Han}*\\p{Han}", options: .regularExpression))
        return r.location != NSNotFound
    }

    func captureYoutubeID() -> NSString? {
        let pattern = "((?<=(v|V)/)|(?<=be/)|(?<=(\\?|\\&)v=)|(?<=embed/))([\\w-]++)"

        let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        let range = NSRange(location: 0, length: self.length)

        guard let result = regex?.firstMatch(in: self as String, range: range) else {
            return nil
        }

        return self.substring(with: result.range) as NSString
    }
}
