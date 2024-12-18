//
//  AppetizerModel.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/18/24.
//

import Foundation

struct Appetizer: Decodable {
    let id: Int
    let name : String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                           name: "Test Appetizers",
                                           description: "Description for delicious appetizer",
                                           price: 9.99,
                                           imageURL: "" ,
                                           calories: 99,
                                           protein: 29,
                                           carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]


}

