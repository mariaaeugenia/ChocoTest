//
//  UIViewController+Extensions.swift
//  ChocoTest
//
//  Created by Maria Eugênia on 1/24/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlert(title: String, message: String, completion: @escaping (Bool) -> Void) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction.init(title: "Ok", style: .default, handler: { (action) in
            completion(true)
        })
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            completion(false)
        })
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
}
