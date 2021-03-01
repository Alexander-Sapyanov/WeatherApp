//
//  SupportClass.swift
//  Weather
//
//  Created by Alexander  Sapianov on 01.03.2021.
//
import CoreLocation
import UIKit

class SupportClass {
    
    class func check(string: String)-> Bool {
        let validCharacters = NSCharacterSet.letters.inverted
        let components = string.components(separatedBy: validCharacters)
        if components.count > 1 {
            return false
        }
        return true
    }
    
    class func getCoorditateFrom(string: String, handler: @escaping(_ coordinate:CLLocationCoordinate2D?, _ error: Error?)-> ()) {
        CLGeocoder().geocodeAddressString(string) { (placemark, error) in
            handler(placemark?.first?.location?.coordinate, error)
        }
    }
}
