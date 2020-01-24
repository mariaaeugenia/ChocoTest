//
//  UIAplication+Extensions.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

extension UIApplication {
    func getWindow() -> UIWindow? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        guard let window = appDelegate.window else {
            return nil
        }
        
        return window
    }
}
