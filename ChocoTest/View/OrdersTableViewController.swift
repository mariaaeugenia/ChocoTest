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
        vm.orderDelegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vm.viewModelDidLoad()
    }
    
    func setupTableViewDataSourceDelegate() {
        let newDataSource = AbstractTableViewDataSource<UITableViewCell>(numberOfItems: self.vm.numberOfRows, identifier: "CELL", configure: { [unowned self] (cell:UITableViewCell , index) in
            let data = self.vm.cellForIndex(index: index)
            cell.textLabel?.text = data.0
            cell.detailTextLabel?.text = data.1
            })
        
        dataSource = newDataSource
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let orderSelected = vm.didSelectOrder(index: indexPath.row)
        performSegue(withIdentifier: "goToMyOrder", sender: orderSelected)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? MyOrderTableViewController {
            if let order = sender as? Order {
                destinationVC.vm.setOrderFor(order)
            }
        }
    }

}

extension OrdersTableViewController: PresentableList {
    func presentList() {
        setupTableViewDataSourceDelegate()
        tableView.reloadData()
    }
}
