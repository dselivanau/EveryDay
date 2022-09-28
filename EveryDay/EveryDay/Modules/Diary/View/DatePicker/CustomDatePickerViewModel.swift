//
//  TestViewModel.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 20.09.22.
//

import Foundation
import Combine
import Resolver

class CustomDatePickerViewModel: ObservableObject {
    
    @Injected var testService: DiaryStorageProtocol
    @Published var todayDate = Date()
    @Published var currentShowDate = Date()
    @Published var monthDifference = 0
    var cancellables = Set<AnyCancellable>()
    
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var currentShowDates = [CalendarDate]()
    var monthTitle = ""
    var yearTitle = ""
    
    init() {
        configureCalendarDates()
        monthDifferenceObserver()
    }
    
    func monthDifferenceObserver() {
        $monthDifference
            .sink { [weak self] newValue in
                guard let self = self else { return }
                self.prepareNewMonthData(value: newValue)
            }
            .store(in: &cancellables)
    }
    
    func testResolver() {
        testService.printHelloTest()
    }
    
    private func prepareNewMonthData(value: Int) {
        currentShowDate = Calendar.current.date(
                    byAdding: .month,
                    value: value,
                    to: todayDate) ?? Date()
        configureCalendarTitles()
        configureCalendarDates()
    }
    
    private func configureCalendarTitles() {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY LLLL"
        
        let date = formatter.string(from: currentShowDate)
        let components = date.components(separatedBy: " ")
        monthTitle = components[1]
        yearTitle = components[0]
    }
    
    private func configureCalendarDates() {
        let calendar = Calendar.current
        var days = currentShowDate.getCurrentMonthDates().compactMap { date -> CalendarDate in
            
            let day = calendar.component(.day, from: date)
            return CalendarDate(day: day, date: date)
        }
        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekDay - 1 {
            days.insert(CalendarDate(day: -1, date: Date()), at: 0)
        }
        currentShowDates = days
    }
}
