//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/18/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State private var showSpinner = true
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    
                    if viewModel.showSpinner == true {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: Color("brandPrimary")))
                            .scaleEffect(2.0, anchor: .center)
                            .padding()
                    } else {
                        List(viewModel.appetizers) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                            
                        }
                    }
                }
                .navigationTitle("🍗 Appetizers")
                .onAppear {
                    viewModel.getAppetizers()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        showSpinner = false
                    }
                }
                .alert(item: $viewModel.alertItem) { alertItem in
                    Alert(title: alertItem.title,
                          message: alertItem.message,
                          dismissButton: alertItem.dismissButton)
                }
            }
        }
    }
}

#Preview {
    AppetizerListView()
}
