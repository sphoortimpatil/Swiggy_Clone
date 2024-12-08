//
//  FoodListTableViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

protocol FoodListTableViewCellDelegate: AnyObject {
    func didTapFoodImage(image: String)
}

import UIKit

class FoodListTableViewCell: UITableViewCell {
    weak var delegate: FoodListTableViewCellDelegate?
    
    private var topRatedFoodImageList: [String] = []

    private let foodImageListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(FoodImageCollectionViewCell.self, forCellWithReuseIdentifier: "FoodImageCollectionViewCell")
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureFoodImageListCollectionView()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFoodImageListCollectionView() {
        contentView.addSubview(foodImageListCollectionView)
        
        foodImageListCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        foodImageListCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        foodImageListCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        foodImageListCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        foodImageListCollectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setDelegates() {
        foodImageListCollectionView.dataSource = self
        foodImageListCollectionView.delegate = self
    }
    
    func setData( _imageList: [String]) {
        topRatedFoodImageList = _imageList
        foodImageListCollectionView.reloadData()
    }

}

extension FoodListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topRatedFoodImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = foodImageListCollectionView.dequeueReusableCell(withReuseIdentifier: "FoodImageCollectionViewCell", for: indexPath) as? FoodImageCollectionViewCell else { return UICollectionViewCell(frame: .zero)}
        cell.setImage(topRatedFoodImageList[indexPath.row])
        return cell
    }
}

extension FoodListTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapFoodImage(image: topRatedFoodImageList[indexPath.row])
    }
}

extension FoodListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 150)
    }
}
