//
//  SupabaseClientProvider.swift
//  Atlas
//
//  Created by Adison  on 28/07/26.
//

import Supabase
import Foundation

enum SupabaseConfig {
    static let url = URL(string: "https://uubtbesgwcmrsxcwymnk.supabase.co")!
    static let anonKey = "sb_publishable_wzy9A4iJkBy-9kwxKPWesw_gdanq3za"
}

final class SupabaseClientProvider {
    static let shared = SupabaseClientProvider()
    let client: SupabaseClient

    private init() {
        client = SupabaseClient(
            supabaseURL: SupabaseConfig.url,
            supabaseKey: SupabaseConfig.anonKey
        )
    }
}
