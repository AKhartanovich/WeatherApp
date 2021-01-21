//
//  DataTableViewCell.swift
//  WeatherApp
//
//  Created by MacBook on 21.01.21.
//

import UIKit

class DataTableViewCell: UITableViewCell {
    
    static let identifier = "dataCell"
    
    let sunriseLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let sunsetLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let feelsLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let wind_speedLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let visibilityLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let pressureLabel: UILabel = {
       let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let sunriseInfoLabel: UILabel = {
       let l = UILabel()
        l.text = "Восход солнца"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let sunsetInfoLabel: UILabel = {
       let l = UILabel()
        l.text = "Заход солнца"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let feelsInfoLabel: UILabel = {
       let l = UILabel()
        l.text = "Ощущается как"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let wind_speedInfoLabel: UILabel = {
       let l = UILabel()
        l.text = "Скорость ветра"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let visibilityInfoLabel: UILabel = {
       let l = UILabel()
        l.text = "Видимость"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    let pressureInfoLabel: UILabel = {
       let l = UILabel()
        l.text = "Давление"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createLayaut()
    }

    func createLayaut() {
        self.heightAnchor.constraint(equalToConstant: 220).isActive = true
        addSubview(sunriseInfoLabel)
        addSubview(sunriseLabel)
        addSubview(sunsetInfoLabel)
        addSubview(sunsetLabel)
        addSubview(feelsLabel)
        addSubview(feelsInfoLabel)
        addSubview(wind_speedLabel)
        addSubview(wind_speedInfoLabel)
        addSubview(visibilityInfoLabel)
        addSubview(visibilityLabel)
        addSubview(pressureInfoLabel)
        addSubview(pressureLabel)
        NSLayoutConstraint.activate([
            sunriseInfoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            sunriseInfoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            sunriseInfoLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10),
            sunriseInfoLabel.heightAnchor.constraint(equalToConstant: 40),
            sunriseLabel.topAnchor.constraint(equalTo: sunriseInfoLabel.topAnchor, constant: 20),
            sunriseLabel.leadingAnchor.constraint(equalTo: sunriseInfoLabel.leadingAnchor),
            sunriseLabel.trailingAnchor.constraint(equalTo: sunriseInfoLabel.trailingAnchor),
            sunriseLabel.heightAnchor.constraint(equalToConstant: 40),
            sunsetInfoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            sunsetInfoLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
            sunsetInfoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            sunsetInfoLabel.heightAnchor.constraint(equalToConstant: 40),
            sunsetLabel.topAnchor.constraint(equalTo: sunsetInfoLabel.topAnchor, constant: 20),
            sunsetLabel.leadingAnchor.constraint(equalTo: sunsetInfoLabel.leadingAnchor),
            sunsetLabel.trailingAnchor.constraint(equalTo: sunsetInfoLabel.trailingAnchor),
            sunsetLabel.heightAnchor.constraint(equalToConstant: 40),
            
            feelsInfoLabel.topAnchor.constraint(equalTo: sunriseLabel.topAnchor, constant: 40),
            feelsInfoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            feelsInfoLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10),
            feelsInfoLabel.heightAnchor.constraint(equalToConstant: 40),
            feelsLabel.topAnchor.constraint(equalTo: feelsInfoLabel.topAnchor, constant: 20),
            feelsLabel.leadingAnchor.constraint(equalTo: feelsInfoLabel.leadingAnchor),
            feelsLabel.trailingAnchor.constraint(equalTo: feelsInfoLabel.trailingAnchor),
            feelsLabel.heightAnchor.constraint(equalToConstant: 40),
            wind_speedInfoLabel.topAnchor.constraint(equalTo: sunsetLabel.topAnchor, constant: 40),
            wind_speedInfoLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
            wind_speedInfoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            wind_speedInfoLabel.heightAnchor.constraint(equalToConstant: 40),
            wind_speedLabel.topAnchor.constraint(equalTo: wind_speedInfoLabel.topAnchor, constant: 20),
            wind_speedLabel.leadingAnchor.constraint(equalTo: wind_speedInfoLabel.leadingAnchor),
            wind_speedLabel.trailingAnchor.constraint(equalTo: wind_speedInfoLabel.trailingAnchor),
            wind_speedLabel.heightAnchor.constraint(equalToConstant: 40),
            
            visibilityInfoLabel.topAnchor.constraint(equalTo: feelsLabel.topAnchor, constant: 40),
            visibilityInfoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            visibilityInfoLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -10),
            visibilityInfoLabel.heightAnchor.constraint(equalToConstant: 40),
            visibilityLabel.topAnchor.constraint(equalTo: visibilityInfoLabel.topAnchor, constant: 20),
            visibilityLabel.leadingAnchor.constraint(equalTo: visibilityInfoLabel.leadingAnchor),
            visibilityLabel.trailingAnchor.constraint(equalTo: visibilityInfoLabel.trailingAnchor),
            visibilityLabel.heightAnchor.constraint(equalToConstant: 40),
            pressureInfoLabel.topAnchor.constraint(equalTo: wind_speedLabel.topAnchor, constant: 40),
            pressureInfoLabel.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
            pressureInfoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            pressureInfoLabel.heightAnchor.constraint(equalToConstant: 40),
            pressureLabel.topAnchor.constraint(equalTo: pressureInfoLabel.topAnchor, constant: 20),
            pressureLabel.leadingAnchor.constraint(equalTo: pressureInfoLabel.leadingAnchor),
            pressureLabel.trailingAnchor.constraint(equalTo: pressureInfoLabel.trailingAnchor),
            pressureLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func configure(with current: Current) {
        self.sunriseLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(current.sunset)), format: "HH:mm")
        self.sunsetLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(current.sunrise)), format: "HH:mm")
        self.feelsLabel.text = "\(Int(current.feels_like - 273.15))"
        self.wind_speedLabel.text = "\(current.wind_speed) KM\\Ч"
        self.visibilityLabel.text = "\((current.visibility / 1000)) KM"
        self.pressureLabel.text = "\(current.pressure) гПа"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getDayForDate(_ date: Date?, format: String) -> String {
        guard let date = date else {return ""}
        let formatter = DateFormatter()
        formatter.dateFormat = format // Monday
        return formatter.string(from: date)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
