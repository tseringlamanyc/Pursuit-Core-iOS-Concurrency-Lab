//
//  Country.swift
//  ConcurrencyLab
//
//  Created by Tsering Lama on 12/5/19.
//  Copyright © 2019 Tsering Lama. All rights reserved.
//

import Foundation

struct Country: Codable {
    
    let name: String
    let capital: String
    let population: Int
    let alpha2Code: String
}

extension Country {
    
    static func getCountry() -> [Country] {
        var country = [Country]()
        
        guard let fileURL = Bundle.main.url(forResource: "country", withExtension: "json") else {
            fatalError()
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let countryData = try JSONDecoder().decode([Country].self, from: data)
            country = countryData
        } catch {
            fatalError("\(error)")
        }
        return country
    }
}
