//
//  View+Extensions.swift
//  Atlas
//
//  Created by Adison  on 04/08/26.
//
import SwiftUI

struct FrostedCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(Color.white.opacity(0.08), lineWidth: 1)
            )
    }
}

extension View {
    func frostedCard() -> some View { modifier(FrostedCard()) }

    func atlasBackground() -> some View {
        self.background(AtlasTheme.background.ignoresSafeArea())
    }
}
