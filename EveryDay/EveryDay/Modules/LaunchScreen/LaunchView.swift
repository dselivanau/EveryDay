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
            VStack(spacing: 0) {
                HStack(){
                    Text("EveryDay")
                        .font(.custom("AdleryPro-Swash", size: 72))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                HStack(){
                    Spacer()
                    Text("твой личный дневник")
                        .font(.custom("AdleryPro-Swash", size: 24))
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom, 250)
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
