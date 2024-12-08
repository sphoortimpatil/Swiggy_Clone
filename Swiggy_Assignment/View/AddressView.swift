//
//  AddressView.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 06/12/24.
//

import UIKit

class AddressView: UIView {
    private let addressTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Office"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .white
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return label
    }()
    private let navigationIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: Constants.Icons.location)
        imageView.tintColor = .white
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        return imageView
    }()
    private let dropDownIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: Constants.Icons.dropDown)
        imageView.tintColor = .white
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        return imageView
    }()
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Block I 1st floor Swiggy, Embassy Tech Village, Phase 1, Banglore"
        label.textAlignment = .center
        label.textColor = .systemGray5
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    private let addressTitleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpAddressTitleView()
        setUpAddressTitleLabel()
        setUpAddressLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpAddressTitleView() {
        self.addSubview(addressTitleView)
        
        addressTitleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        addressTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        addressTitleView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        addressTitleView.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setUpAddressTitleLabel() {
        addressTitleView.addSubview(navigationIconView)
        addressTitleView.addSubview(dropDownIcon)
        addressTitleView.addSubview(addressTitleLabel)
        
        navigationIconView.centerYAnchor.constraint(equalTo: addressTitleView.centerYAnchor).isActive = true
        navigationIconView.leadingAnchor.constraint(equalTo: addressTitleView.leadingAnchor).isActive = true
        navigationIconView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        addressTitleLabel.centerYAnchor.constraint(equalTo: addressTitleView.centerYAnchor).isActive = true
        addressTitleLabel.leadingAnchor.constraint(equalTo: navigationIconView.trailingAnchor, constant: 10).isActive = true
        
        dropDownIcon.centerYAnchor.constraint(equalTo: addressTitleView.centerYAnchor).isActive = true
        dropDownIcon.leadingAnchor.constraint(equalTo: addressTitleLabel.trailingAnchor, constant: 10).isActive = true
        dropDownIcon.widthAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setUpAddressLabel() {
        self.addSubview(addressLabel)
        
        addressLabel.topAnchor.constraint(equalTo: addressTitleView.bottomAnchor).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
