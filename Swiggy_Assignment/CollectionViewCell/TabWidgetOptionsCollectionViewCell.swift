//
//  TabWidgetOptionsCollectionViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

class TabWidgetOptionsCollectionViewCell: UICollectionViewCell {
    private let tabView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 16
        return view
    }()
    private let tabWidgetLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.text = ""
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureSelectedView()
        configureMovieListOptionsLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSelectedView() {
        contentView.addSubview(tabView)
        
        tabView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        tabView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        tabView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tabView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func configureMovieListOptionsLabel() {
        contentView.addSubview(tabWidgetLabel)
        
        tabWidgetLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        tabWidgetLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        tabWidgetLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        tabWidgetLabel.textAlignment = .center
    }
    
    func setTabItems(label: String) {
        tabWidgetLabel.text = label
    }
    
    func updateSelected(_ isSelected: Bool) {
        switch isSelected {
            case true:
                tabView.backgroundColor = .black
                tabWidgetLabel.textColor = .white
            case false:
                tabView.backgroundColor = .white
                tabWidgetLabel.textColor = .black
        }
    }
}
