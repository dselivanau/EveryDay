//
//  EveryDayApp.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 17.06.22.
//

import SwiftUI

@main
struct EveryDayApp: App {
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            
            LaunchView()
                .onAppear(){
                    for family: String in UIFont.familyNames
                            {
                                print(family)
                                for names: String in UIFont.fontNames(forFamilyName: family)
                                {
                                    print("== \(names)")
                                }
                            }
                }
            //ContentView()
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        return true;
//    }
//}
