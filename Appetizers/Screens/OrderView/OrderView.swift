//
//  OrderView.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/18/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    @State private var orderPlaced = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(.plain)
                    
                    Button {
                        order.items = []
                        orderPlaced = true
                    } label: {
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                    
                    .alert(isPresented: $orderPlaced) {
                        Alert(title: Text("Order Placed"), message: Text("Your order has been placed. Enjoy!"), dismissButton: .default(Text("Dismiss")))
                    }
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty {
                    EmptyState(imageName: "empty-order", message: "You have no items in your order. \nPlease add an item")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

#Preview {
    OrderView()
}
