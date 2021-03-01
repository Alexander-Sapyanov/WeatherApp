//
//  TableViewDataSource.swift
//  Weather
//
//  Created by Alexander  Sapianov on 01.03.2021.
//

import Foundation
import SwiftSVG

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CitiesTableViewCell.identifier, for: indexPath) as! CitiesTableViewCell
        
        let weatherIcon = UIView(SVGData: citiesList[indexPath.row].imageWeather)
        cell.backgroundColor = UIColor(red: 117/256, green: 187/256, blue: 253/256, alpha: 1)
        cell.cityLabel.text = citiesList[indexPath.row].name.components(separatedBy: "/").last
        cell.tempLabel.text = "\(citiesList[indexPath.row].airTemperature) С°"
        cell.descrLabel.text = citiesList[indexPath.row].condition.capitalized
        cell.tempView.addSubview(weatherIcon)
        cell.layer.cornerRadius = 18
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let verticalPadding: CGFloat = 8
        let maskLayer = CALayer()
        
        maskLayer.cornerRadius = 18
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
        cell.layer.mask = maskLayer
    }
}
