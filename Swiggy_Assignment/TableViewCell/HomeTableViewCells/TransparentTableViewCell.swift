//
//  TransparentTableViewCell.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

class TransparentTableViewCell: UITableViewCell {
    private let transparentView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureTransparentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTransparentView() {
        contentView.addSubview(transparentView)
        transparentView.translatesAutoresizingMaskIntoConstraints = false
        
        transparentView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        transparentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        transparentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        transparentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        transparentView.heightAnchor.constraint(equalToConstant: 210).isActive = true
        transparentView.backgroundColor = .clear
    }
}
