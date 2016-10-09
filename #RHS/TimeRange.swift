//
//  TimeRange.swift
//  #RHS
//
//  Created by Mitchell Sweet on 10/9/16.
//  Copyright © 2016 Mitchell Sweet. All rights reserved.
//

import Foundation

extension NSDate {
    func withTime(hour hour: Int, minute: Int) -> NSDate {
        let components = NSCalendar.currentCalendar().components([.Year, .Month, .Day], fromDate: self)
        components.hour = hour
        components.minute = minute
        return NSCalendar.currentCalendar().dateFromComponents(components)!
    }
}

typealias Time = (hour: Int, minute: Int)

struct TimeRange {
    let start: Time
    let end: Time
    
    var isNow: Bool {
        let now = NSDate()
        let startDate = now.withTime(hour: start.hour, minute: start.minute)
        let endDate = now.withTime(hour: end.hour, minute: end.minute)
        return now.compare(startDate) == .OrderedDescending &&
               now.compare(endDate) == .OrderedAscending
    }
}
