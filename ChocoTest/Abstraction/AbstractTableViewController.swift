//
//  AbstractTableViewController.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class AbstractTableViewController<T: ViewModel>: UITableViewController, ViewModelDelegate {
    typealias T = T
    var vm: T

    convenience init(_ viewModel: T) {
        self.init()
        vm = viewModel
    }

    required public init() {
        vm = .init()
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        vm = .init()
        super.init(coder: aDecoder)
    }

}
