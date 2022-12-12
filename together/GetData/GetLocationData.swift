//
//  GetData.swift
//  together
//
//  Created by Cristea Octavian on 02/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation

enum LocationsError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct LocationRequest {
    let resourceURL: URL
    
    init(county: String) {
        let resourceString = "https://togetherapi.herokuapp.com/place/\(county)"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getLocations(completion: @escaping(Result<[GetLocation], LocationsError>) -> Void ) {
        
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            print(self.resourceURL)
            print(jsonData)
            
            do {
                let decoder = JSONDecoder()
                let locationsResponse = try decoder.decode([GetLocation].self, from: jsonData)
                let locatrionDetails = locationsResponse
                completion(.success(locatrionDetails))
            } catch {
                completion(.failure(.canNotProcessData))
            }
            
        }
        dataTask.resume()
    }
    
}
