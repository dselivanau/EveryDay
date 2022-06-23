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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        let window = UIApplication
                            .shared
                            .connectedScenes
                            .flatMap { ($0 as? UIWindowScene)?.windows ?? []}
                            .first{$0.isKeyWindow}
                        
                        window?.rootViewController = UIHostingController(rootView: RootTabView())
                        window?.makeKeyAndVisible()
                    }
                    
                }
            //RootTabView()
//                .onAppear(){
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        RootTabView()
//                    }
//                }
        }
    }
}

//class AppDelegate: NSObject, UIApplicationDelegate {
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//
//        return true;
//    }
//}
