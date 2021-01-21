//
//  CollectionDailyViewCell.swift
//  WeatherApp
//
//  Created by MacBook on 21.01.21.
//

import UIKit

class CollectionDailyViewCell: UICollectionViewCell {
    
    static let identifier = "dailyCell"
    var timeLabel = UILabel()
    var iconImage: UIImageView = UIImageView()
    var tempLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createLayaut()
    }
    
    
    func createLayaut() {
//        backgroundColor = .clear
        addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        timeLabel.textAlignment = .center
        addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.topAnchor.constraint(equalTo: timeLabel.bottomAnchor).isActive = true
        iconImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        iconImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        iconImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addSubview(tempLabel)
        tempLabel.translatesAutoresizingMaskIntoConstraints = false
        tempLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor).isActive = true
        tempLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        tempLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        tempLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        tempLabel.textAlignment = .center
    }
    
    func configure(with model: Hourly) {
        self.tempLabel.text = "\(Int(model.temp - 273.15))°"
        self.iconImage.contentMode = .scaleAspectFit
//        self.iconImage.image = UIImage(named: "clear")
        self.timeLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt)))
        let icon = model.weather[0].main.lowercased()
        if icon.contains("clear") {
            self.iconImage.image = UIImage(named: "clear")
        } else if icon.contains("rain") {
            self.iconImage.image = UIImage(named: "rain")
        } else if icon.contains("snow") {
            self.iconImage.image = UIImage(named: "snow")
        } else if icon.contains("cloud") {
            self.iconImage.image = UIImage(named: "cloud")
        } else {
            self.iconImage.image = UIImage(named: "clear")
        }
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let date = date else {return ""}
        let formatter = DateFormatter()
        formatter.dateFormat = "HH" // 12
        return formatter.string(from: date)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
