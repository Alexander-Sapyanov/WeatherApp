//
//  TableViewDelegate.swift
//  Weather
//
//  Created by Alexander  Sapianov on 01.03.2021.
//

import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
           return 108
     }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DescripotionViewController()
        vc.data = citiesList[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
}


