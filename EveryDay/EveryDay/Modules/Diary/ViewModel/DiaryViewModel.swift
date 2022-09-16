//
//  DiaryViewModel.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 12.09.22.
//

import Foundation
import SwiftUI

class DiaryViewModel: ObservableObject {
    
    @Published var currentDate: Date = Date()
    @Published var currentMonth: Int = 0
    
    init() {
        
    }
}
