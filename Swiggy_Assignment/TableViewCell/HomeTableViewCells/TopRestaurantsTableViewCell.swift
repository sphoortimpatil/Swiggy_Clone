//
//  TopRestaurantsTableViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

class TopRestaurantsTableViewCell: UITableViewCell {
    private let restaurantView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        return view
    }()
    private let foodImageView = FoodImageView()
    private let resturantNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Restaurant Name"
        label.numberOfLines = 2
        return label
    }()
    private let resturanCousineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.text = Constants.cousineText
        label.numberOfLines = 2
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureResturantView()
        configureFoodImageView()
        configureResturantNameLabel()
        configureResturanCousineLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureResturantView() {
        contentView.addSubview(restaurantView)
        restaurantView.translatesAutoresizingMaskIntoConstraints = false
        
        restaurantView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        restaurantView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        restaurantView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        restaurantView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        restaurantView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }
    
    private func configureFoodImageView() {
        contentView.addSubview(foodImageView)
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        
        foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        foodImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        foodImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        foodImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        foodImageView.layer.shadowOpacity = 0.8
        foodImageView.layer.shadowOffset = .zero
        foodImageView.layer.masksToBounds = false
        foodImageView.layer.shadowRadius = 2
    }
    
    private func configureResturantNameLabel() {
        contentView.addSubview(resturantNameLabel)
        resturantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resturantNameLabel.topAnchor.constraint(equalTo: foodImageView.topAnchor, constant: 10).isActive = true
        resturantNameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 15).isActive = true
        resturantNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    private func configureResturanCousineLabel() {
        contentView.addSubview(resturanCousineLabel)
        resturanCousineLabel.translatesAutoresizingMaskIntoConstraints = false
        
        resturanCousineLabel.topAnchor.constraint(equalTo: resturantNameLabel.bottomAnchor, constant: 6).isActive = true
        resturanCousineLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 15).isActive = true
        resturanCousineLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    func setImage(_ name: String) {
        foodImageView.setImage(name)
    }
}
