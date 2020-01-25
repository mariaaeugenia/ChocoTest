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
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vm.orderDelegate = self
        setupEmptyListMessage()
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
    
    func setupEmptyListMessage() {
        label.font = UIFont(name: "Avenir Next - Bold", size: 40)
        label.text = "Ops!\n You didn't place any order yet"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        self.view.addSubview(label)
        label.widthAnchor.constraint(equalTo: self.tableView.widthAnchor, multiplier: 0.8).isActive = true
        label.centerYAnchor.constraint(equalTo: self.tableView.centerYAnchor, constant: -50).isActive = true
        label.centerXAnchor.constraint(equalTo: self.tableView.centerXAnchor).isActive = true
    }

}

extension OrdersTableViewController: PresentableList {
    func presentList() {
        setupTableViewDataSourceDelegate()
        tableView.reloadData()
        label.isHidden = (vm.numberOfRows != 0)
        
    }
}
