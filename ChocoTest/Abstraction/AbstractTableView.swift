//
//  AbstractTableViewCell.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class AbstractTableViewCell<T: ViewModel>: UITableViewCell, ViewModelDelegate {
    
    typealias T = T
    var vm: T

    required init() {
        vm = .init()
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
