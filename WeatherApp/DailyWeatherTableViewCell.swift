//
//  DailyWeatherCell.swift
//  WeatherApp
//
//  Created by MacBook on 20.01.21.
//

import UIKit

class DailyWeatherTableViewCell: UITableViewCell {
    
    static let identifier = "DailyCell"
    var dayLabel: UILabel = UILabel()
    var highTemperatureLabel: UILabel = UILabel()
    var lowTemperatureLabel: UILabel = UILabel()
    var iconImageView: UIImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createLayaut()
    }
    func createLayaut() {
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        highTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        lowTemperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(lowTemperatureLabel)
        lowTemperatureLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        lowTemperatureLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        lowTemperatureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        lowTemperatureLabel.widthAnchor.constraint(equalToConstant: 65).isActive = true
        addSubview(highTemperatureLabel)
        highTemperatureLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        highTemperatureLabel.trailingAnchor.constraint(equalTo: lowTemperatureLabel.trailingAnchor, constant: -40).isActive = true
        highTemperatureLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        highTemperatureLabel.widthAnchor.constraint(equalToConstant: 65).isActive = true
        addSubview(iconImageView)
        iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        iconImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        addSubview(dayLabel)
        dayLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        dayLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dayLabel.trailingAnchor.constraint(equalTo: iconImageView.leadingAnchor, constant: -10).isActive = true
    }
    
    func configure(with model: Daily) {
        let lowTemp = model.temp.min - 273.15
        let highTemp = model.temp.max - 273.15
        self.lowTemperatureLabel.text = "\(Int(lowTemp))°"
        self.highTemperatureLabel.text = "\(Int(highTemp))°"
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt)))

        let icon = model.weather[0].main.lowercased()
        if icon.contains("clear") {
            self.iconImageView.image = UIImage(named: "clear")
        } else if icon.contains("rain") {
            self.iconImageView.image = UIImage(named: "rain")
        } else if icon.contains("snow") {
            self.iconImageView.image = UIImage(named: "snow")
        } else if icon.contains("cloud") {
            self.iconImageView.image = UIImage(named: "cloud")
        } else {
            self.iconImageView.image = UIImage(named: "clear")
        }
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let date = date else {return ""}
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE" // Monday
        return formatter.string(from: date)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
