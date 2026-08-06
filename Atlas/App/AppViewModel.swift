//
//  AppViewModel.swift
//  Atlas
//
//  Created by Adison  on 04/08/26.
//

import Foundation
import Combine

@MainActor
final class AppViewModel: ObservableObject {
    @Published var hasCompletedOnboarding: Bool = UserDefaults.standard.bool(forKey: "hasCompletedOnboarding")

    func completeOnboarding() {
        hasCompletedOnboarding = true
        UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
    }
}
