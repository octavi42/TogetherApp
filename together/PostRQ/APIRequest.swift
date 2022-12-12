//
//  APIRequest.swift
//  together
//
//  Created by Cristea Octavian on 11/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation

enum APIERROR: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct APIRequest {
    let resourceURL: URL
    
    init(endpoint: String) {
        var resourceString = "https://togetherapi.herokuapp.com/place/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else {
            
            resourceString = "https://togetherapi.herokuapp.com/place/gulag"
            
            let resourceURL = URL(string: resourceString)
            
            self.resourceURL = resourceURL!
            
            return
        }
        
        self.resourceURL = resourceURL
    }
    
    func save (_ locationSave: Location, completion: @escaping(Result<Location, APIERROR>) -> Void) {
        
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(locationSave)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                
                do {
                    let locationData = try JSONDecoder().decode(Location.self, from: jsonData)
                    completion(.success(locationData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
                
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
}
