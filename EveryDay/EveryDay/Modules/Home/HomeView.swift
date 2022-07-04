//
//  HomeView.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 23.06.22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView(){
            Text("Home view!")
                .navigationTitle("Home")
                .toolbar(){
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image(systemName: "gearshape")
                    }
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
