//
//  CustomDatePicker.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 9.09.22.
//

import SwiftUI

struct CustomDatePicker: View {
    @Binding var currentDate: Date
    @State var currentMonth = 0
    
    
    var body: some View {
        VStack(spacing: 35){
            
            let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack(spacing: 20){
                VStack(alignment: .leading, spacing: 10){
                    Text(extraData()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                    
                    Text(extraData()[1])
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0)
                
                Button{
                    withAnimation {
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Button{
                    withAnimation {
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            
            //Day views
            HStack(spacing: 0){
                ForEach(days, id: \.self){day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            //Dates
            
            //Lazy Grid
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(exctractDate()) { value in
                    CardView(value: value)
                }
            }
        }
        .onChange(of: currentMonth) { newValue in
            //update month
         currentDate = getCurrentMonth()
            print(currentMonth)
        }
    }
    
    @ViewBuilder
    func CardView(value: CalendarDate) -> some View {
        ZStack {
            let currentDay = Calendar.current.dateComponents([.day, .month, .year], from: Date())
            let currentDate = Calendar.current.dateComponents([.month, .year], from: currentDate)
            if let day = currentDay.day, let month = currentDay.month, let year = currentDay.year, let generalMonth = currentDate.month, let generalYear = currentDate.year  {
                if (value.day == day && generalMonth == month && generalYear == year ){
                    Image(systemName: "heart")
                        .resizable()
                        .foregroundColor(.pink)
                }
            }
            
            VStack {
                if value.day != -1 {
                    Text("\(value.day)")
                        .font(.title2.bold())
                }
            }
            .padding(.vertical, 8)
            .frame(height: 45, alignment: .top)
        }
    }
    
    //extrating Year and Month for display
    func extraData() -> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY LLLL"
        
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        let calendar = Calendar.current
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else
        { return Date() }
        
        return currentMonth
    }
    
    func exctractDate() -> [CalendarDate] {
        let calendar = Calendar.current
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getCurrentMonthDates().compactMap { date -> CalendarDate in
            
            //getting day
            let day = calendar.component(.day, from: date)
            return CalendarDate(day: day, date: date)
        }
        
        //adding offsetdays to get exact week day
        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekDay - 1 {
            days.insert(CalendarDate(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}

extension Date {
    func getCurrentMonthDates() -> [Date] {
        let calendar = Calendar.current
        
        //
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        //getting date
        return range.compactMap { day -> Date in
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
