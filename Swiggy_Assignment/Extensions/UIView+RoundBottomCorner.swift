//
//  UIView+RoundBottomCorner.swift
//  Swiggy_Assignment
//
//  Created by Sphoorti Patil on 07/12/24.
//

import UIKit

extension UIView {
    func roundBottomCorners(radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: [.bottomLeft, .bottomRight],
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        self.layer.mask = shape
    }
}
