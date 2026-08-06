//
//  AtlasApp.swift
//  Atlas
//
//  Created by Adison  on 27/07/26.
//

import SwiftUI

@main
struct AtlasApp: App {
    @StateObject private var authService = AuthService()
    @StateObject private var router = AppRouter()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(authService)
                .environmentObject(router)
                .onOpenURL { url in
                    Task {
                        try? await authService.handleDeepLink(url: url)
                    }
                    DeepLinkHandler.handle(url: url, router: router)
                }
        }
    }
}
