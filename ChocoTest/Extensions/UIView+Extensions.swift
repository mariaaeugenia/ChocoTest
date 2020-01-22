//
//  UIButton+Extensions.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyGradientLayer() {
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [UIColor(hexString: "0A9FF9").cgColor, UIColor(hexString: "0466F1").cgColor]
        gradientLayer.cornerRadius = 10
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
