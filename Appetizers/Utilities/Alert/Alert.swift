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
    
    // Network Alerts
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
    
    //Account Alerts
    
    static let formImcomplete = AlertItem(title: Text("Form Incomplete"),
                                            message: Text("Please ensure all fields in the form have beeen completed."),
                                            dismissButton: .default(Text("Dismiss")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                            message: Text("Please make sure that the email you entered is a valid email address."),
                                            dismissButton: .default(Text("Dismiss")))
    
}
