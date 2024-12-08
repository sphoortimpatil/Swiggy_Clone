//
//  BannerCollectionViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 06/12/24.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    private let bannerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let configuration = UIImage.SymbolConfiguration(weight: .light)
        let iconImage = UIImage(named: "Banner1")
        imageView.image = iconImage
        imageView.tintColor  = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureBannderImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureBannderImageView() {
        contentView.addSubview(bannerImageView)
        
        bannerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        bannerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        bannerImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        bannerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
    
    func setImage(_ name: String) {
        bannerImageView.image = UIImage(named: name)
    }
    
    func updateCornerradius() {
        bannerImageView.layer.cornerRadius = 0
    }
}
