//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/18/24.
//

import Foundation

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        WebServices.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                
                switch result {
                    
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        alertItem = AlertContext.invalidResposne
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResposne
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
