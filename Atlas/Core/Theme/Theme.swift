//
//  Theme.swift
//  Atlas
//
//  Created by Adison  on 04/08/26.
//

import SwiftUI

enum AtlasTheme {
    static let background = Color(red: 0.06, green: 0.06, blue: 0.08)
    static let surface = Color(red: 0.11, green: 0.11, blue: 0.14)
    static let accent = Color(red: 0.85, green: 0.62, blue: 0.32)
    static let textPrimary = Color.white.opacity(0.95)
    static let textSecondary = Color.white.opacity(0.6)

    static let headline = Font.system(.title2, design: .serif).weight(.semibold)
    static let largeHeadline = Font.system(.largeTitle, design: .serif).weight(.bold)
    static let body = Font.system(.body, design: .default)
    static let caption = Font.system(.footnote, design: .default)
}
