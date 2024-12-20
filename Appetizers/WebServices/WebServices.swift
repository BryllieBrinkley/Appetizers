//
//  WebServices.swift
//  Appetizers
//
//  Created by Jibryll Brinkley on 12/18/24.
//

import UIKit

final class WebServices {
    
    static let shared = WebServices()
    
    private let cache = NSCache<NSString, UIImage>()

    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
    
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func downloadImages(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = urlString
        
        if let image = cache.object(forKey: cacheKey as NSString) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, _ in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey as NSString)
            completed(image)
        }
        task.resume()
        
    }
}
