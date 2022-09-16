//
//  DiaryView.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 23.06.22.
//

import SwiftUI

struct DiaryView: View {
    
    @ObservedObject var viewModel = DiaryViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 20){
                CustomDatePicker(currentDate: $viewModel.currentDate,
                                 currentMonth: $viewModel.currentMonth,
                                 selectedDate: $viewModel.selectedDate)
            }
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}
