//
//  Alert.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/18/24.
//

import SwiftUI

struct AlertItem: Identifiable {
    
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData      = AlertItem(title: Text("Server Error"),
                                            message: Text("The data recieved from the server was invalid. Please contact support"),
                                            dismissButton: .default(Text("Dismiss")))
    
    static let invalidResposne  = AlertItem(title: Text("Server Error"),
                                            message: Text("Invalid response from the server. Please try again later or contact support."),
                                            dismissButton: .default(Text("Dismiss")))
    
    static let invalidURL       = AlertItem(title: Text("Server Error"),
                                            message: Text("There was an issue connecting to the server. If this issue persists, please contact support."),
                                            dismissButton: .default(Text("Dismiss")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                            message: Text("Unabale to complete your request at this time. Please check your internet connection and try again."),
                                            dismissButton: .default(Text("Dismiss")))
}
