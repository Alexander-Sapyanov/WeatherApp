//
//  CitiesTableViewCell.swift
//  Weather
//
//  Created by Alexander  Sapianov on 28.02.2021.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    
    static let identifier = "CitiesCell"
    
    let cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Reglo-Bold", size: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Reglo-Bold", size: 34)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var tempView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let descrLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.layoutMargins = UIEdgeInsets(top: 15, left: 3, bottom: 15, right: 3)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(cityLabel)
        addSubview(tempLabel)
        addSubview(tempView)
        addSubview(descrLabel)
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            cityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            
            descrLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -18),
            descrLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            
            tempLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            tempLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 25),
            
            tempView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            tempView.centerYAnchor.constraint(equalTo: centerYAnchor),
            tempView.heightAnchor.constraint(equalToConstant: 40),
            tempView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
}
