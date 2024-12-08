//
//  SearchBar.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 06/12/24.
//

import UIKit

class SearchBar: UIView {
    private let searchBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()
    private let searchText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.text = "Search for 'Biryani'"
        label.numberOfLines = 1
        return label
    }()
    private let searchIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: Constants.Icons.search)
        imageView.tintColor = .systemGray
        return imageView
    }()
    private let separatorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "|"
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    private let speechInputIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: Constants.Icons.microphone)
        imageView.tintColor = .swiggyOrange
        return imageView
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSearchBar()
        configureSearchText()
        configureLeftIcons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSearchBar() {
        self.addSubview(searchBar)
        
        searchBar.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        searchBar.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    private func configureSearchText() {
        searchBar.addSubview(searchText)
        
        searchText.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        searchText.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 10).isActive = true
    }
    
    private func configureLeftIcons() {
        searchBar.addSubview(speechInputIcon)
        
        speechInputIcon.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        speechInputIcon.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -10).isActive = true
        speechInputIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        searchBar.addSubview(separatorLabel)
        
        separatorLabel.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        separatorLabel.trailingAnchor.constraint(equalTo: speechInputIcon.leadingAnchor, constant: -10).isActive = true
        
        searchBar.addSubview(searchIcon)
        
        searchIcon.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor).isActive = true
        searchIcon.trailingAnchor.constraint(equalTo: separatorLabel.leadingAnchor, constant: -10).isActive = true
        searchIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
}
