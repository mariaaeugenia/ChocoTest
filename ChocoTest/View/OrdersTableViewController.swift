//
//  OrdersTableViewController.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class OrdersTableViewController: AbstractTableViewController<OrdersViewModel> {
    
    var dataSource = AbstractTableViewDataSource<UITableViewCell>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        vm.orderDelegate = self
        vm.viewModelDidLoad()
    }
    
    func setupTableViewDataSourceDelegate() {
        let newDataSource = AbstractTableViewDataSource<UITableViewCell>(numberOfItems: self.vm.numberOfRows, identifier: "CELL", configure: { [unowned self] (cell:UITableViewCell , index) in
            let data = self.vm.cellForIndex(index: index)
            cell.textLabel?.text = data.0
            cell.detailTextLabel?.text = data.1
            }) { [unowned self] (index) in
                self.performSegue(withIdentifier: "goToMyOrder", sender: nil)
        }
        dataSource = newDataSource
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

}

extension OrdersTableViewController: OrderBusinessLogic {
    func presentList() {
        setupTableViewDataSourceDelegate()
        tableView.reloadData()
    }
}
