//
//  ErrorCases.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/18/24.
//

import Foundation

enum APError: Error {
    
    case invalidURL, invalidResponse, invalidData, unableToComplete
    
    var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case .invalidResponse: return "Invalid Response"
        case .invalidData: return "Invalid Data"
        case .unableToComplete: return "Unable to complete"
        }
    }
}
