//
//  EveryDayApp.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 17.06.22.
//

import SwiftUI

@main
struct EveryDayApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .onAppear(){
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        let window = UIApplication
                            .shared
                            .connectedScenes
                            .flatMap { ($0 as? UIWindowScene)?.windows ?? []}
                            .first{$0.isKeyWindow}
                        
                        let rootTabView = RootTabView().environment(\.managedObjectContext, persistenceController.container.viewContext)
                        window?.rootViewController = UIHostingController(rootView: rootTabView)
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

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        if #available(iOS 15, *) {
//                        let navigationBarAppearance = UINavigationBarAppearance()
//                        navigationBarAppearance.configureWithOpaqueBackground()
//                        navigationBarAppearance.titleTextAttributes = [
//                            NSAttributedString.Key.foregroundColor : UIColor.white
//                        ]
//                        navigationBarAppearance.backgroundColor = UIColor.blue
//                        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
//                        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
//                        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
                    
                    let tabBarApperance = UITabBarAppearance()
                    tabBarApperance.configureWithOpaqueBackground()
                    UITabBar.appearance().scrollEdgeAppearance = tabBarApperance
                    UITabBar.appearance().standardAppearance = tabBarApperance
                }
        return true;
    }
}
