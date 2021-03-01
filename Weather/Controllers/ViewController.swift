//
//  ViewController.swift
//  Weather
//
//  Created by Alexander  Sapianov on 28.02.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let cityTableView = UITableView()
    let network = Network.shared
    var rootModel = StartModel.shared
    var citiesList = [CityData]()
    let searchBar = UISearchBar()
    
    //MARK: -Lifecycle
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupSearchBar(searchBar: searchBar)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpSearchBar()
        loadWeather()
        showDescription()
    }
    
    
    private func loadWeather() {
        for city in rootModel.citiesName {
            self.network.gettingWeather(for: city.lat, longitud: city.lon) { [weak self] (data, error) in
                
                guard let data = data else { return }
                guard let urlIcon = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(data.fact.icon).svg"),
                      let iconData = try? Data(contentsOf: urlIcon)
                else { return }
                let weatherCity = CityData(name: data.info.tzinfo.name,
                                           airTemperature: data.fact.temp,
                                           url: data.info.url,
                                           imageWeather: iconData,
                                           condition: data.fact.condition,
                                           feels_like: data.fact.feels_like,
                                           wind_speed: data.fact.wind_speed)
                print(data.info.tzinfo.name)
                DispatchQueue.main.async {
                    self?.citiesList.append(weatherCity)
                    self?.cityTableView.reloadData()
                }
            }
        }
    }
    
    
    private func setUpTableView() {
        cityTableView.backgroundColor = .clear
        cityTableView.delegate = self
        cityTableView.dataSource = self
        cityTableView.showsVerticalScrollIndicator = false
        cityTableView.translatesAutoresizingMaskIntoConstraints = false
        cityTableView.register(CitiesTableViewCell.self, forCellReuseIdentifier: CitiesTableViewCell.identifier)
        
        view.addSubview(cityTableView)
        
        NSLayoutConstraint.activate([
            cityTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            cityTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            cityTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            cityTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    private func setUpSearchBar() {

        searchBar.delegate = self
        searchBar.placeholder = "Search a city"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundColor = .white
        
        // убирает рамку вокруг сеарч ьара
        searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        view.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            searchBar.bottomAnchor.constraint(equalTo: cityTableView.topAnchor, constant: -10),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupSearchBar(searchBar : UISearchBar) {
        searchBar.setPlaceholderTextColorTo(color: .skyColor)
    }
    
    func showDescription() {
        let vc = DescripotionViewController()
        network.getCoordinatesOfCity(searchBar.text!) { (result) in
            switch result {
            
            case.success(let location):
                self.network.gettingWeather(for: location.latitude, longitud: location.longitude) { [weak self] (data, error) in
                    guard let data = data else {return}
                    guard let urlIcon = URL(string: "https://yastatic.net/weather/i/icons/blueye/color/svg/\(data.fact.icon).svg"),
                          let iconData = try? Data(contentsOf: urlIcon)
                    else { return }
                    let weatherCity = CityData(name: data.info.tzinfo.name,
                                               airTemperature: data.fact.temp,
                                               url: data.info.url,
                                               imageWeather: iconData,
                                               condition: data.fact.condition,
                                               feels_like: data.fact.feels_like,
                                               wind_speed: data.fact.wind_speed)
                    
                    vc.data = weatherCity
                    self?.present(vc, animated: true, completion: nil)
                }
                
            case.failure(let error):
                print(error)
            }
        }
    }
}


