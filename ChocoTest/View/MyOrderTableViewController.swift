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
        setupTableViewController()
    }
    
    func setupTableViewController() {
        navigationItem.title = "Total: \(vm.getPriceTotal())"
        let newDataSource = AbstractTableViewDataSource<ProductTableViewCell>(numberOfItems: vm.numberOfRows, identifier: "CELL", configure: { [unowned self] (cell:ProductTableViewCell , index) in
            let data = self.vm.cellForIndex(index: index)
            cell.configureCell(viewModel: data)
            cell.accessoryType = .detailButton
        })
        dataSource = newDataSource
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let desc = vm.didTapDetailButton(index: indexPath.row)
        self.presentAlert(title: "Description", message: desc, completion: {_ in})
    }

}
