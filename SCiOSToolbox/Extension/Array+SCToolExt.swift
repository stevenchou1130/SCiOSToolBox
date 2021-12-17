//
//  Array+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/16.
//

import Foundation

extension Array {

    public var withoutFirstElement: Array {
        return Array(self.dropFirst())
    }

    public mutating func rearrange(from: Int, to: Int) {
        if from == to { return }
        precondition(from != to && indices.contains(from) && indices.contains(to), "invalid indexes")
        insert(remove(at: from), at: to)
    }
}

extension Array {

    public func toJSON() -> String? {
        if let jsonData = try? JSONSerialization.data(withJSONObject: self, options: []) {
            return String(bytes: jsonData, encoding: .utf8)
        }

        return nil
    }
}

extension Array where Element: Hashable {

    // Usage
    /*
     * let names1 = ["John", "Paul", "Ringo"]
     * let names2 = ["Ringo", "Paul", "George"]
     * let difference = names1.difference(from: names2)    // ["George", "John"]
     */
    public func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }

    // Usage
    /*
     * let names1 = ["John", "Paul", "Ringo"]
     * let names2 = ["Ringo", "Paul", "George"]
     * let same = names1.same(from: names2)    // ["Paul"]
     */
    public func same(with other: [Element]) -> [Element] {
        let result = self.filter () { other.contains($0) }
        return Array(result)
    }
}
