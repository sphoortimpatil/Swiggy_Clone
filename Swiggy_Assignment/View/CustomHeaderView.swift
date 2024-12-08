//
//  CustomHeaderView.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 06/12/24.
//

import UIKit

class CustomHeaderView: UIView {
    private let addressView = AddressView()
    private let profileView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: Constants.Icons.profile)
        imageView.tintColor = .black
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAddressView()
        setUpProfileView()
        setupProfileImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureAddressView() {
        addressView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(addressView)
        
        addressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        addressView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        addressView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75).isActive = true
    }
    
    private func setUpProfileView() {
        self.addSubview(profileView)
        
        profileView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        profileView.leadingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: 10).isActive = true
        profileView.leadingAnchor.constraint(equalTo: addressView.trailingAnchor, constant: 10).isActive = true
        profileView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.25).isActive = true
    }
    
    private func setupProfileImageView() {
        profileView.addSubview(profileImageView)
        
        profileImageView.topAnchor.constraint(equalTo: profileView.topAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        profileImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
