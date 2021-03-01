//
//  RootModel.swift
//  Weather
//
//  Created by Alexander  Sapianov on 28.02.2021.
//

import Foundation

final class StartModel {
    
    static let shared = StartModel()
    private init() {}
    
    var citiesName = [
        CitiesName(lat: 55.7522, lon: 41.6156),
        CitiesName(lat: 46.3497, lon: 48.0408),
        CitiesName(lat: 33.3606, lon: 83.7636),
        CitiesName(lat: 35.4200, lon: 51.2500),
        CitiesName(lat: 51.3026, lon: 0.0739),
        CitiesName(lat: 52.3100, lon: 13.2300),
        CitiesName(lat: 53.2001, lon: 50.15),
        CitiesName(lat: 49.9386, lon: 30.3141),
        CitiesName(lat: 48.5200, lon:  2.1959),
        CitiesName(lat: 56.0184, lon: 92.8672)
    ]
    
}

