//
//  BannerTableViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 06/12/24.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    private let carouselView = UIView()
    private let bannerImageList = Constants.bannerImageList
    private let bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(BannerCollectionViewCell.self, forCellWithReuseIdentifier: "BannerCollectionViewCell")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 10
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()
    private var currentPage = 0
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureCarouselView()
        configureBannerCollectionView()
        setDelegates()
        configurePageControl()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCarouselView() {
        contentView.addSubview(carouselView)
        carouselView.translatesAutoresizingMaskIntoConstraints = false
        
        carouselView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        carouselView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        carouselView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        carouselView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        carouselView.heightAnchor.constraint(equalToConstant: 160).isActive = true
    }
    
    private func configureBannerCollectionView() {
        carouselView.addSubview(bannerCollectionView)
        
        bannerCollectionView.topAnchor.constraint(equalTo: carouselView.topAnchor).isActive = true
        bannerCollectionView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        bannerCollectionView.widthAnchor.constraint(equalTo: carouselView.widthAnchor).isActive = true
        bannerCollectionView.centerXAnchor.constraint(equalTo: carouselView.centerXAnchor).isActive = true
    }
    
    private func setDelegates() {
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
    }
    
    private func configurePageControl() {
        carouselView.addSubview(pageControl)
        
        pageControl.topAnchor.constraint(equalTo: bannerCollectionView.bottomAnchor, constant: 10).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.widthAnchor.constraint(equalTo: carouselView.widthAnchor, multiplier: 5 / 8).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: carouselView.centerXAnchor).isActive = true
    }
}

extension BannerTableViewCell: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let indexPath = bannerCollectionView.indexPathsForVisibleItems.first else { return }
        pageControl.currentPage = indexPath.row
        bannerCollectionView.reloadData()
    }
}

extension BannerTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: bannerCollectionView.frame.width - 10, height: 120)
    }
}

extension BannerTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bannerImageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell(frame: .zero) }
        cell.setImage(bannerImageList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}
