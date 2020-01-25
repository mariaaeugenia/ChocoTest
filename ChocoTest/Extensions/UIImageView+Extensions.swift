//
//  UIImageView+Extensions.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(url: URL?, placeholder: String) {
        DispatchQueue.global().async { [weak self] in
            if let path = url, let data = try? Data(contentsOf: path) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            } else {
                DispatchQueue.main.async {
                    self?.image = UIImage(named: placeholder)
                }
            }
        }
    }
}
