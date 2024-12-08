//
//  FoodDescriptionTableViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

class FoodDescriptionTableViewCell: UITableViewCell {    
    private let foodNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.text = "Masala Dosa"
        return label
    }()
    private let foodDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 0
        label.text = Constants.foodDescription
        return label
    }()
    private let foodIngredientsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Ingredients"
        return label
    }()
    private let foodIngredientItemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 0
        label.text = Constants.foodIngredients
        return label
    }()
    private let recepieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        label.text = "Recepie"
        return label
    }()
    private let recipeDetailsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 0
        label.text = Constants.foodRecepie
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureFoodNameLabel()
        configureFoodDescriptionLabel()
        configureInfgredientsLabel()
        configureFoodIngredientItemLabel()
        configureRecepieTitlelabel()
        configureRecepieDetailslabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFoodNameLabel() {
        contentView.addSubview(foodNameLabel)
        
        foodNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        foodNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        foodNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureFoodDescriptionLabel() {
        contentView.addSubview(foodDescriptionLabel)
        
        foodDescriptionLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 10).isActive = true
        foodDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        foodDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureInfgredientsLabel() {
        contentView.addSubview(foodIngredientsLabel)
        
        foodIngredientsLabel.topAnchor.constraint(equalTo: foodDescriptionLabel.bottomAnchor, constant: 10).isActive = true
        foodIngredientsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        foodIngredientsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureFoodIngredientItemLabel() {
        contentView.addSubview(foodIngredientItemLabel)
        
        foodIngredientItemLabel.topAnchor.constraint(equalTo: foodIngredientsLabel.bottomAnchor, constant: 5).isActive = true
        foodIngredientItemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        foodIngredientItemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    private func configureRecepieTitlelabel() {
        contentView.addSubview(recepieTitleLabel)
        
        recepieTitleLabel.topAnchor.constraint(equalTo: foodIngredientItemLabel.bottomAnchor, constant: 10).isActive = true
        recepieTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        recepieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
    }
    
    private func configureRecepieDetailslabel() {
        contentView.addSubview(recipeDetailsLabel)
        
        recipeDetailsLabel.topAnchor.constraint(equalTo: recepieTitleLabel.bottomAnchor, constant: 5).isActive = true
        recipeDetailsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        recipeDetailsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        recipeDetailsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    }
}
