//
//  APIResponse.swift
//  Weather
//
//  Created by Alexander  Sapianov on 28.02.2021.
//

import Foundation

struct Weather: Codable {
    var info: Info
    var fact: Fact
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case fact = "fact"
    }
}

struct Info: Codable {
    var tzinfo: TzInfo
    var url: String

    struct TzInfo: Codable {
        var name: String
        var abbr: String
    }
}

struct Fact: Codable {
    var temp: Double
    var icon: String
    var condition: String
    var feels_like: Int
    var wind_speed: Double
    
    private enum CodingKeys: String, CodingKey {
        case temp
        case icon
        case condition
        case feels_like = "feels_like"
        case wind_speed = "wind_speed"
    }
}
struct CitiesName {
    var lat: Double
    var lon: Double
}

struct CityData {
    var name: String
    var airTemperature: Double
    var url: String
    var imageWeather: Data
    var condition: String
    var feels_like: Int
    var wind_speed: Double
}
