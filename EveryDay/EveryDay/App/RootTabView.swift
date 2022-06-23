//
//  RootTabView.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 19.06.22.
//

import SwiftUI

struct RootTabView: View {
    var body: some View {
        TabView(){
            HomeView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            WishesView()
                .tabItem{
                    Label("Wishes", systemImage: "person.icloud")
                }
            DiaryView()
                .tabItem{
                    Label("Diary", systemImage: "book")
                }
            SleepView()
                .tabItem{
                    Label("Sleep", systemImage: "powersleep")
                }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView()
    }
}
