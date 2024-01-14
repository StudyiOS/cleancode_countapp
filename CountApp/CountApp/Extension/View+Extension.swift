//
//  View+Extension.swift
//  CountApp
//
//  Created by Leo on 1/14/24.
//

import SwiftUI

// MARK: ViewModifier
struct VitaminCell: ViewModifier {
    let color: Color
    let height: CGFloat

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: height)
            .contentShape(.contextMenuPreview, // contextmenu radius
                          RoundedRectangle(cornerRadius: 15))
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.5), lineWidth: 0.5)
            }
    }
}

extension View {
    func vitaminCell(color: Color, height: CGFloat = 70) -> some View {
        modifier(VitaminCell(color: color, height: height))
    }
}
