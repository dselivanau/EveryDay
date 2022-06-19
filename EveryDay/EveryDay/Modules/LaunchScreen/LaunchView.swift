//
//  LaunchView.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 19.06.22.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        ZStack(){
            Image("launch")
                .resizable()
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
            Text("EveryDay");
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
