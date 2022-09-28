//
//  App+Injection.swift
//  EveryDay
//
//  Created by Dzianis Selivanau on 28.09.22.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        register { DiaryStorageService() as DiaryStorageProtocol }
    }
}
