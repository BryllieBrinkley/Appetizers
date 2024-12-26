//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/26/24.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
   
   @Published var firstName = ""
   @Published var lasttName = ""
   @Published var email = ""
   @Published var birthdate = Date()
   @Published var extraNapkins = false
   @Published var noIce = false
    
    @Published var alertItem: AlertItem?
    
    var isValidForm: Bool {
        
        guard !firstName.isEmpty && !lasttName.isEmpty && !email.isEmpty else {
            alertItem = AlertContext.formImcomplete
            return false
        }
        
        guard email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        print("changes have been saved.")
    }
}



