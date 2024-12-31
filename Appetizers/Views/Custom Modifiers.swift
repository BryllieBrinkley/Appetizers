//
//  Custom Modifiers.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/27/24.
//

import SwiftUI


struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
        .buttonStyle(.bordered)
        .tint(.brandPrimary)
        .controlSize(.large)

    }
    
}
