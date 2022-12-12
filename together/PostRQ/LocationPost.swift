//
//  LocationPost.swift
//  together
//
//  Created by Cristea Octavian on 11/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation

final class Location: Codable {
    var phoneId: String
    var latitude: Double
    var longitude: Double
    var stringDate: String
    var intDate: Int
    
    init (phoneId: String, latitude: Double, longitude: Double, stringDate: String, intDate: Int) {
        self.phoneId = phoneId
        self.latitude = latitude
        self.longitude = longitude
        self.stringDate = stringDate
        self.intDate = intDate
    }
}

