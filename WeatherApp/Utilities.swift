//
//  Utilities.swift
//  WeatherApp
//
//  Created by MacBook on 20.01.21.
//

import UIKit
import CoreLocation

extension MainViewController {
    func requestWeather() {
        guard let currentLocation = self.currentLocation else {return}
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(lat)&lon=\(long)&lang=ru&appid=299872d5c1b4cc0105147d000e564157") else { return}
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {print("Something wrong!"); return}
            
            var json: WeatherResponse?
            
            do {
                json = try JSONDecoder().decode(WeatherResponse.self, from: data)
            }
            catch {
                print("error: \(error)")
            }
            guard let result = json else {return}
            print(result.current.weather)
            print(result.timezone)
            print(result.current.weather)
            
            let entries = result.daily
            
            self.models.append(contentsOf: entries)
            
            let current = result.current
            self.current = current
            
            self.loc = result.timezone
            
            self.hourlyModels = result.hourly
            
            DispatchQueue.main.async {
                self.table.tableHeaderView = self.createTableHeader()
                self.table.reloadData()
                let locArr = result.timezone.split(separator: "/")
                self.locationLabel.text = String(locArr[1])
                self.locationLabel.font = UIFont(name: "Helvetica", size: 40)
                self.summaryLabel.text = current.weather[0].description
            }
        }
        
        task.resume()
        //    print("\(long) & \(lat)")
    }
    
}

