//
//  UIButton+Extensions.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyGradientLayer(with radius: CGFloat, and frame: CGRect) {
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = [UIColor(hexString: "0A9FF9").cgColor, UIColor(hexString: "0466F1").cgColor]
        gradientLayer.cornerRadius = radius
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat, and frame: CGRect) {
        let path = UIBezierPath(roundedRect: frame, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}
