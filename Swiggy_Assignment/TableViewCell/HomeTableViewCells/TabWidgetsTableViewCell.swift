//
//  TabWidgetsTableViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

protocol TabWidgetsTableViewCellDelegate: AnyObject {
    func didSelectTabWidgetOption(index: Int)
}

class TabWidgetsTableViewCell: UITableViewCell {
    weak var delegate: TabWidgetsTableViewCellDelegate?
    private var selectedIndex: Int = 0
    private let tabWidgetOptions = Constants.tabWidgetsOptionsLabel
    private let tabWidgetLCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TabWidgetOptionsCollectionViewCell.self, forCellWithReuseIdentifier: "TabWidgetOptionsCell")
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureMovieOptionsLabelCollectionView()
        setDelegates()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMovieOptionsLabelCollectionView() {
        contentView.addSubview(tabWidgetLCollectionView)
        
        tabWidgetLCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        tabWidgetLCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        tabWidgetLCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        tabWidgetLCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        tabWidgetLCollectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setDelegates() {
        tabWidgetLCollectionView.dataSource = self
        tabWidgetLCollectionView.delegate = self
    }
}

extension TabWidgetsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabWidgetOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = tabWidgetLCollectionView.dequeueReusableCell(withReuseIdentifier: "TabWidgetOptionsCell", for: indexPath) as? TabWidgetOptionsCollectionViewCell else { return UICollectionViewCell(frame: .zero)}
        
        cell.setTabItems(label: tabWidgetOptions[indexPath.row])
        if indexPath.row == 0 {
            delegate?.didSelectTabWidgetOption(index: 0)
            cell.updateSelected(true)
        }
        return cell
    }
}

extension TabWidgetsTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if selectedIndex != indexPath.row {
            let previousIndexPath = IndexPath(row: selectedIndex, section: 0)
            if let previousCell = collectionView.cellForItem(at: previousIndexPath) as? TabWidgetOptionsCollectionViewCell {
                previousCell.updateSelected(false)
            }
    
            selectedIndex = indexPath.row
            if let newTabSelectionCell = collectionView.cellForItem(at: indexPath) as? TabWidgetOptionsCollectionViewCell {
                delegate?.didSelectTabWidgetOption(index: selectedIndex)
                newTabSelectionCell.updateSelected(true)
            }
        }
    }
}

extension TabWidgetsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 30)
    }
}
