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
                
                if viewModel.showSpinner == true {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: Color("brandPrimary")))
                        .scaleEffect(2.0, anchor: .center)
                        .padding()
                } else {
                    List(viewModel.appetizers) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                viewModel.selectedAppetizer = appetizer
                                viewModel.isShowingDetail = true
                            }
                    }
                    .navigationTitle("🍗 Appetizers")
                    .listStyle(.plain)
                    .disabled(viewModel.isShowingDetail ? true : false)
                }
            }
            .onAppear {
                viewModel.getAppetizers()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    showSpinner = false
                }
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            
            if viewModel.isShowingDetail {
                DetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail: $viewModel.isShowingDetail)
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}
