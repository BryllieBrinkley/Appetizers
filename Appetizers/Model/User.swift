//
//  User.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/26/24.
//

import Foundation

struct User: Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var noIce = false
    
}
