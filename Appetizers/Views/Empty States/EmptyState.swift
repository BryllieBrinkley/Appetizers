//
//  EmptyState.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/27/24.
//

import SwiftUI

struct EmptyState: View {
    
    let imageName: String
    let message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y: -70)
        }
    }
}

#Preview {
    EmptyState(imageName: "empty-order", message: "test message. adding length to make suere that it is long for testing purposes")
}
