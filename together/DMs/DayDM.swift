 //
//  DayDM.swift
//  together
//
//  Created by Cristea Octavian on 05/05/2020.
//  Copyright © 2020 Cristea Octavian. All rights reserved.
//

import Foundation

struct QuickStats: Decodable {
    var last_updated_on_string: String
    var totals: Total
    var history: [Total]
}
 
struct Total: Decodable {
    var date: Int
    var date_string: String
    var confirmed: Int
    var cured: Int
    var deaths: Int
}
