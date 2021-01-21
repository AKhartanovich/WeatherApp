//
//  InfoTableViewCell.swift
//  WeatherApp
//
//  Created by MacBook on 21.01.21.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    static let identifier = "infoCell"
    let infoLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createLayaut()
    }
    
    
    func createLayaut() {
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        addSubview(infoLabel)
        infoLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        infoLabel.numberOfLines = 5
    }
    
    func configure(with current: Current, daily: [Daily]) {
        var info = current.weather[0].description
        info.removeFirst()
        let i = (current.weather[0].description.first?.uppercased())! + info
        self.infoLabel.text = "\(i). Максимальная температура воздуха: \(Int(daily[0].temp.max - 273.15))°. Минимальная температура воздуха: \(Int(daily[0].temp.min - 273.15))°"
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
