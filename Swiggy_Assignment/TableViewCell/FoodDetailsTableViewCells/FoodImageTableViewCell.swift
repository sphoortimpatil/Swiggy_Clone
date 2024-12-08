//
//  FoodImageTableViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

class FoodImageTableViewCell: UITableViewCell {
    private let foodImageList = Constants.bannerImageList
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Banner1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    private let foodImageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureFoodImageCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureeFoodImageView() {
        contentView.addSubview(foodImageView)
        
        foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        foodImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        foodImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func configureFoodImageCollectionView() {
        contentView.addSubview(foodImageCollectionView)
        
        foodImageCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        foodImageCollectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        foodImageCollectionView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        foodImageCollectionView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        foodImageCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        foodImageCollectionView.delegate = self
        foodImageCollectionView.dataSource = self
    }
}

extension FoodImageTableViewCell: UICollectionViewDelegate { }

extension FoodImageTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: foodImageCollectionView.frame.width, height: 200)
    }
}

extension FoodImageTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = foodImageCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell(frame: .zero) }
        cell.setImage(foodImageList[indexPath.row])
        cell.updateCornerradius()
        return cell
    }

}
