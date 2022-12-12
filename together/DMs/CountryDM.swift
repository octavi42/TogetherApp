//
//  countryDM.swift
//  together
//
//  Created by Cristea Octavian on 02/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation

struct Countrys: Decodable {
    var data: [CountrysData]
}

struct CountrysData: Decodable {
    var county: String
    var numberInfected: Int
    var totalPopulation: Int
    var infectionPercentage: Float
    var infectionsPerThousand: Float
}
