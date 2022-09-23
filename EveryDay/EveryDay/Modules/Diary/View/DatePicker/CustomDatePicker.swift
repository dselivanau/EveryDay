//
//  TestCustomPicker.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 20.09.22.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @StateObject var viewModel = CustomDatePickerViewModel()
    
    @Binding var selectedDate: Date?
    
    init(selectedDate: Binding<Date?> = .constant(nil)) {
        self._selectedDate = selectedDate
    }
    
    var body: some View {
        VStack(spacing: 35) {
            
            HStack(spacing: 20){
                Button{
                    withAnimation {
                        viewModel.monthDifference -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                Text(viewModel.monthTitle)
                    .font(.title.bold())
                Text(viewModel.yearTitle)
                    .font(.title.bold())
                
                Button{
                    withAnimation {
                        viewModel.monthDifference += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 0){
                ForEach(viewModel.days, id: \.self){day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(viewModel.currentShowDates) { value in
                    CardView(value: value)
                        .onTapGesture {
                            selectedDate = value.date
                        }
                }
            }
        }
    }
    
    @ViewBuilder
    func CardView(value: CalendarDate) -> some View {
        ZStack {
            let currentDay = Calendar.current.dateComponents([.day, .month, .year], from: viewModel.todayDate)
            let currentDate = Calendar.current.dateComponents([.month, .year], from: viewModel.currentShowDate)
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
}

struct TestCustomPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomDatePicker()
    }
}
