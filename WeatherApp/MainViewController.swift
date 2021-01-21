//
//  MainViewController.swift
//  WeatherApp
//
//  Created by MacBook on 19.01.21.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    var table: UITableView = UITableView.init(frame: .zero, style: .plain)
    var locationLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    var summaryLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var loc: String?
    var current: Current?
    var currentWeather: CurrentWeather?
    var models = [Daily]()
    var hourlyModels = [Hourly]()

    override func loadView() {
        super.loadView()
        
        table.register(DailyWeatherTableViewCell.self, forCellReuseIdentifier: DailyWeatherTableViewCell.identifier)
        table.register(HourlyWeatherTableViewCell.self, forCellReuseIdentifier: HourlyWeatherTableViewCell.identifier)
        table.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        table.register(DataTableViewCell.self, forCellReuseIdentifier: DataTableViewCell.identifier)
        
        table.delegate = self
        table.dataSource = self
        setupLocation()
        createLoyaut()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeather()
        }
    }
    
    ///Create interface in app
    func createLoyaut() {
        view.backgroundColor = .white
        view.addSubview(locationLabel)
        locationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        locationLabel.textAlignment = .center
        locationLabel.textColor = .black
        view.addSubview(summaryLabel)
        summaryLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 0).isActive = true
        summaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        summaryLabel.textAlignment = .center
        summaryLabel.textColor = .black
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: summaryLabel.bottomAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func createTableHeader() -> UIView {
        let headerVIew = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 150))
        let tempLabel = UILabel(frame: CGRect(x: 10, y: 0, width: view.frame.size.width, height: 150))

        headerVIew.addSubview(tempLabel)
        tempLabel.textAlignment = .center
        
        guard let current = self.current else {
            return UIView()
        }

        tempLabel.text = "\(Int(current.temp - 273.15))°"
        tempLabel.font = UIFont(name: "Helvetica", size: 80)

        return headerVIew
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return models.count
        } else if section == 2 {
            return 1
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HourlyWeatherTableViewCell.identifier, for: indexPath) as! HourlyWeatherTableViewCell
            cell.configure(with: hourlyModels)
            cell.selectedBackgroundView = bgColorView
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DailyWeatherTableViewCell.identifier, for: indexPath) as! DailyWeatherTableViewCell
            cell.configure(with: models[indexPath.row])
            cell.selectedBackgroundView = bgColorView
            return cell
        } else if indexPath.section == 2 {
            guard let current = current else {return UITableViewCell()}
            let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as! InfoTableViewCell
            cell.configure(with: current, daily: models)
            cell.selectedBackgroundView = bgColorView
            return cell
        }
        guard let current = current else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.identifier, for: indexPath) as! DataTableViewCell
        cell.configure(with: current)
        cell.selectedBackgroundView = bgColorView
        return cell
    }
    
}
