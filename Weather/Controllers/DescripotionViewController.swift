//
//  DescripotionViewController.swift
//  Weather
//
//  Created by Alexander  Sapianov on 28.02.2021.
//

import UIKit

class DescripotionViewController: UIViewController {
    
    var data: CityData?
    let startModel = StartModel.shared
    
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .skyColor
        label.font = UIFont(name: "Reglo-Bold", size: 40)
        return label
    }()
    
    var descrLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Reglo-Bold", size: 24)
        label.textColor = .skyColor
        return label
    }()
    
    var tempLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Reglo-Bold", size: 34)
        label.textColor = .skyColor
        return label
    }()
    
    var feelLike: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .skyColor
        return label
    }()
    
    var tempView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 200, y: 90, width: 150, height: 150)
        return view
    }()
    
    var windSpeed: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = .skyColor
        return label
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        view.backgroundColor = .white
        view.addSubview(tempView)
        let weatherIcon = UIView(SVGData: data!.imageWeather) { image in
            image.resizeToFit(self.tempView.bounds)
        }
        tempView.addSubview(weatherIcon)
    }
    
    // MARK: - Function
    
    func setUpUI() {
        view.addSubview(tempLabel)
        view.addSubview(descrLabel)
        view.addSubview(feelLike)
        view.addSubview(nameLabel)
        view.addSubview(windSpeed)
        
        tempLabel.text = "\(data!.airTemperature) С°"
        descrLabel.text = data?.condition
        feelLike.text = "Feels like: \(data!.feels_like)"
        nameLabel.text = data?.name.components(separatedBy: "/").last
        windSpeed.text = "Wind speed: \(data!.wind_speed)"
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tempLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            tempLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            
            descrLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 10),
            descrLabel.leftAnchor.constraint(equalTo: feelLike.centerXAnchor),
            
            feelLike.topAnchor.constraint(equalTo: descrLabel.bottomAnchor, constant: 10),
            feelLike.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            
            
            
            windSpeed.topAnchor.constraint(equalTo: feelLike.bottomAnchor, constant: 10),
            windSpeed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50)
        ])
    }
}

