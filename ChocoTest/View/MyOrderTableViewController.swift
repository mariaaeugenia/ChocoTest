//
//  MyOrderTableViewController.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class MyOrderTableViewController: AbstractTableViewController<MyOrderViewModel> {
    
    var dataSource = AbstractTableViewDataSource<ProductTableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ProductTableViewCell",bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CELL")
        tableView.rowHeight = 80
    }
    
    func setupViewController(_ viewModel: MyOrderViewModel) {
        navigationItem.title = "Total: \(viewModel.getPriceTotal())"
        let newDataSource = AbstractTableViewDataSource<ProductTableViewCell>(numberOfItems: viewModel.numberOfRows, identifier: "CELL", configure: { (cell:ProductTableViewCell , index) in
            let data = viewModel.cellForIndex(index: index)
            cell.configureCell(viewModel: data)
            cell.accessoryType = .detailButton
        })
        dataSource = newDataSource
        tableView.dataSource = dataSource
    }
    
}
