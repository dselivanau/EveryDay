//
//  CalendarDateModel.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 12.09.22.
//

import Foundation

struct CalendarDate: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
