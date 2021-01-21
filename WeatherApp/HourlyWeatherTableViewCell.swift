//
//  HourlyWeatherCell.swift
//  WeatherApp
//
//  Created by MacBook on 20.01.21.
//

import UIKit


class HourlyWeatherTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let identifier = "HorlyCell"
    var layoutOne: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return layout
    }()
    var collectionView: UICollectionView!
    var models = [Hourly]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createConstraint()
        collectionView.register(CollectionDailyViewCell.self, forCellWithReuseIdentifier: CollectionDailyViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func createConstraint() {
        layoutOne.itemSize = CGSize(width: 50, height: 150)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layoutOne)
        collectionView.backgroundColor = .clear
        self.heightAnchor.constraint(equalToConstant: 100).isActive = true
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    }
    
    func configure(with models: [Hourly]) {
        self.models = models
        collectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionDailyViewCell.identifier, for: indexPath) as! CollectionDailyViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
