//
//  FoodImageCollectionViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

class FoodImageCollectionViewCell: UICollectionViewCell {
    private let foodImageView = FoodImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureFoodImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFoodImageView() {
        contentView.addSubview(foodImageView)
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        
        foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        foodImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        foodImageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        foodImageView.layer.shadowOpacity = 0.8
        foodImageView.layer.shadowOffset = .zero
        foodImageView.layer.masksToBounds = false
        foodImageView.layer.shadowRadius = 2
    }
    
    func setImage(_ name: String) {
        foodImageView.setImage(name)
    }
}
