//
//  DiaryViewModel.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 12.09.22.
//

import Foundation
import SwiftUI
import Combine

class DiaryViewModel: ObservableObject {
    
    @Published var selectedDate: Date?
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        $selectedDate
            .sink { date in
                guard let date = date else { return }
                print(date.description(with: .current))
            }
            .store(in: &cancellables)
    }
}
