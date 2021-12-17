//
//  NSDate+SCToolExt.swift
//  SCiOSToolbox
//
//  Created by Steven on 2021/7/15.
//

import UIKit

public extension NSDate {
    
    @objc enum SCWeekday: Int {
        case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturday
    }

    @objc func next(_ weekday: SCWeekday,
                           considerToday: Bool = false) -> String? {

        let date = self as Date
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(weekday: weekday.rawValue)

        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "M/d"
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Taipei")

        if considerToday && calendar.component(.weekday, from: date) == weekday.rawValue {
            return dateFormatter.string(from: date)
        }

        if let nextDate = calendar.nextDate(after: date,
                                            matching: components,
                                            matchingPolicy: .nextTime,
                                            direction: .forward) {

            return dateFormatter.string(from: nextDate)
        }

        return nil
    }
}
