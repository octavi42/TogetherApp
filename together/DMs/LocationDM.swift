//
//  LocationPost.swift
//  together
//
//  Created by Cristea Octavian on 11/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation

struct GetLocation: Decodable {
    var phoneId: String
    var latitude: Double
    var longitude: Double
    var stringDate: String
    var intDate: Int
}

