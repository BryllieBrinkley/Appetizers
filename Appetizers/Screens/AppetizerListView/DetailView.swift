//
//  DetailView.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/23/24.
//

import SwiftUI

struct DetailView: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        VStack {
            Image("asian-flank-steak")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack {
                    VStack {
                        Text("Calories")
                            .font(.caption)
                            .bold()
                        
                        Text("\(appetizer.calories)")
                        
                    }
                    
                    VStack {
                        Text("Carbs")
                        Text("\(appetizer.carbs)")
                    }
                    
                    VStack {
                        Text("Proteins")
                        Text("\(appetizer.protein)")
                    }
                }
            }
            
            Spacer()
            
            Button {
                print("tapped")
            } label: {
                
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .frame(width: 260, height: 50)
                    .foregroundColor(.white)
                    .background(Color.brandPrimary)
                    .cornerRadius(10)
            }
            .padding(.bottom, 30)

            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            print("X tapped")
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }, alignment: .topTrailing)
    }
}

#Preview {
    DetailView(appetizer: MockData.sampleAppetizer)
}
