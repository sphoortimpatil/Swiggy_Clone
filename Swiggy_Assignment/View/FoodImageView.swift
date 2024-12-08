//
//  FoodImageView.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

class FoodImageView: UIView {
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        let iconImage = UIImage(named: "Food1")
        imageView.image = iconImage
        imageView.tintColor  = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds = true
        return imageView
    }()
    private var favouriteImageView: UIImageView = {
        let heartImage = UIImage(systemName: Constants.Icons.heart, withConfiguration: UIImage.SymbolConfiguration(weight: .bold))?.withRenderingMode(.alwaysTemplate)
        
        let imageView = UIImageView(image: heartImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let offerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font =  UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textAlignment = .center
        label.text = "50% OFF"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureFoodImageView()
        configureFavouriteImageView()
        configureOfferLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFoodImageView() {
        self.addSubview(foodImageView)

        foodImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        foodImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        foodImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        foodImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        foodImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        foodImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    private func configureFavouriteImageView() {
        self.addSubview(favouriteImageView)
        
        favouriteImageView.topAnchor.constraint(equalTo: foodImageView.topAnchor, constant: 5).isActive = true
        favouriteImageView.trailingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: -5).isActive = true
        favouriteImageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        favouriteImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        favouriteImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onFavouriteButtonTapped))
        favouriteImageView.addGestureRecognizer(tapGesture)
        foodImageView.bringSubviewToFront(favouriteImageView)
    }
    
    private func configureOfferLabel() {
        foodImageView.addSubview(offerLabel)
        
        offerLabel.leadingAnchor.constraint(equalTo: foodImageView.leadingAnchor, constant: 5).isActive = true
        offerLabel.bottomAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: -5).isActive = true
    }
    
    @objc private func onFavouriteButtonTapped() {
        // Add functionality for favourite button tap
    }
    
    func setImage(_ name: String) {
        foodImageView.image = UIImage(named: name)
    }
}
