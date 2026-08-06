//
//  SupabaseClientProvider.swift
//  Atlas
//
//  Created by Adison  on 28/07/26.
//

import Supabase
import Foundation

final class SupabaseClientProvider {
    static let shared = SupabaseClientProvider()
    let client: SupabaseClient

    private init() {
        // Attempt to load secrets from SupabaseSecrets.swift
        // If the file is missing (e.g., not copied from template), we will crash with a clear message.
        let urlString: String
        let anonKey: String

        #if DEBUG
        // In debug, we can try to load from Secrets; if not present, use empty strings to force setup.
        if let secretsURL = ProcessInfo.processInfo.environment["SUPABASE_URL"],
           !secretsURL.isEmpty,
           let secretsKey = ProcessInfo.processInfo.environment["SUPABASE_ANON_KEY"],
           !secretsKey.isEmpty {
            urlString = secretsURL
            anonKey = secretsKey
        } else if let secretsURL = ProcessInfo.processInfo.environment["SUPABASE_URL"] {
            // fallback to only URL
            urlString = secretsURL
            anonKey = SupabaseSecrets.anonKey
        } else {
            urlString = SupabaseSecrets.urlString
            anonKey = SupabaseSecrets.anonKey
        }
        #else
        // For release, we expect the secrets to be provided via build environment or the Secrets file.
        urlString = SupabaseSecrets.urlString
        anonKey = SupabaseSecrets.anonKey
        #endif

        guard let url = URL(string: urlString) else {
            fatalError("Invalid Supabase URL: \(urlString). Please set SUPABASE_URL in your environment or SupabaseSecrets.swift.")
        }
        guard !anonKey.isEmpty, !anonKey.contains("your-anon-key") else {
            fatalError("Supabase anon key is not configured. Please set SUPABASE_ANON_KEY in your environment or SupabaseSecrets.swift.")
        }

        client = SupabaseClient(
            supabaseURL: url,
            supabaseKey: anonKey
        )
    }
}

// MARK: - Secrets Template (if not present, compile will fail; see SupabaseSecrets.swift.template)
enum SupabaseSecrets {
    static let urlString = ""
    static let anonKey = ""
}