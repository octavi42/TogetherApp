//
//  GetData.swift
//  together
//
//  Created by Cristea Octavian on 02/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation

enum CountryDataError: Error {
    case noDataAvailable
    case canNotProcessData
}

enum QuickStatsError: Error {
    case noDataAvailable
    case canNotProcessData
}

struct CountrysURL {
    let resourceURL: URL
    
    init() {
        let resourceString = "https://api1.datelazi.ro/api/v2/data/county-infections"
        
        guard let resourceURL = URL(string: resourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
}

func getCountryData(completion: @escaping(Result<[CountrysData], CountryDataError>) -> Void) {
    let resourceString = "https://api1.datelazi.ro/api/v2/data/county-infections"
    
    guard let resourceURL = URL(string: resourceString) else {fatalError()}
    
    let dataTask = URLSession.shared.dataTask(with: resourceURL) { data,_,_ in
        guard let jsonData = data else {
            completion(.failure(.noDataAvailable))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let countrysResponse = try decoder.decode(Countrys.self, from: jsonData)
            let countrysDetail = countrysResponse.data
            completion(.success(countrysDetail))
        } catch {
            completion(.failure(.canNotProcessData))
        }
        
    }
    dataTask.resume()
}

func getDayCountryData(completion: @escaping(Result<QuickStats, QuickStatsError>) -> Void) {
    let resourceString = "https://api1.datelazi.ro/api/v2/data/quickstats"
    
    guard let resourceURL = URL(string: resourceString) else {fatalError()}
    
    let dataTask = URLSession.shared.dataTask(with: resourceURL) { data,_,_ in
        guard let jsonData = data else {
            completion(.failure(.noDataAvailable))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let countrysResponse = try decoder.decode(QuickStats.self, from: jsonData)
            let countrysDetail = countrysResponse
            completion(.success(countrysDetail))
        } catch {
            completion(.failure(.canNotProcessData))
        }
        
    }
    dataTask.resume()
}
