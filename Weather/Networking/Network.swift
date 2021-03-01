//
//  Network.swift
//  Weather
//
//  Created by Alexander  Sapianov on 28.02.2021.
//

import Foundation
import Alamofire
import CoreLocation

protocol NetworkManagerProtocol {
    func gettingWeather(for latitude: Double, longitud: Double, completion: @escaping(_ cityData: Weather?, _ error: Error?) -> Void)
}

class Network: NetworkManagerProtocol{
    
    static let shared = Network()

    func gettingWeather(for latitude: Double, longitud: Double, completion: @escaping (Weather?, Error?) -> Void) {
        guard let url = URL(string: "https://api.weather.yandex.ru/v2/forecast?") else { return }
        let headders: HTTPHeaders = ["X-Yandex-API-Key": "6a7c2bd8-bac2-4e63-a430-f06a4a0ba6b2"]
        let parametrs: [String: String] = [
            "lat": "\(latitude)",
            "lon": "\(longitud)",
            "lang": "ru_RU",
            "hours": "\(true)"
        ]
        AF.request(url, parameters: parametrs, headers: headders).responseDecodable(of: Weather.self) { (response) in
            if response.value == nil {
                completion(nil, response.error)
            }
            guard let cityWeather = response.value else { return }
            completion(cityWeather, nil)
        }
    }
     func getCoordinatesOfCity(_ city: String, completion: @escaping (Result<CLLocationCoordinate2D, CLError>) -> Void) {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let coordinates = placemarks?.first?.location?.coordinate {
                completion(.success(coordinates))
            } else if let error = error as? CLError {
                completion(.failure(error))
            }
        }
    }
}
