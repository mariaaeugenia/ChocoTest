//
//  HomeViewController.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class HomeViewController: AbstractViewController<ProductsViewModel> {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var preOrderView: UIView!
    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    
    var dataSource = AbstractTableViewDataSource<ProductTableViewCell>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewCell()
        vm.delegate = self
        vm.productDelegate = self
        vm.viewModelDidLoad()
    }
    
    func setupTableViewCell() {
        let nib = UINib(nibName: "ProductTableViewCell",bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CELL")
        tableView.rowHeight = 80
    }
    
    func setupTableViewDataSourceDelegate() {
        let newDataSource = AbstractTableViewDataSource<ProductTableViewCell>(numberOfItems: self.vm.numberOfRows, identifier: "CELL", configure: { [unowned self] (cell:ProductTableViewCell , index) in
                let vm = self.vm.cellForIndex(index: index)
                cell.configureCell(viewModel: vm)
                cell.addButton.tag = index
                cell.accessoryType = .detailButton
            })
        dataSource = newDataSource
        tableView.dataSource = dataSource
        tableView.delegate = self
    }

}
    
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.4

        UIView.animate(
            withDuration: 0.3,
            delay: 0.01 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let closeAction = UIContextualAction(style: .normal, title:  "ADD", handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self?.vm.didSelectItem(index: indexPath.row)
            success(true)
        })
        closeAction.backgroundColor = UIColor(hexString: "007AFF")
        return UISwipeActionsConfiguration(actions: [closeAction])
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let modifyAction = UIContextualAction(style: .normal, title:  "Delete", handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self?.vm.didDeselectItem(index: indexPath.row)
            success(true)
        })
        modifyAction.backgroundColor = .red
    
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }

}

extension HomeViewController: Presentable, ProductsBusinessLogic, AddButtonPressing {
    //Presentable
    func setLoading(isLoading: Bool) {
        DispatchQueue.main.async {
            if isLoading {
                LoadingView.shared.showLoading()
            } else {
                LoadingView.shared.hideLoading()
            }
        }
    }
    
    func presentError(message: String) {
        self.presentAlert(title: "Error", message: message, completion:{_ in })
    }
    //ProductsBusinessLogic
    func presentList() {
        DispatchQueue.main.async {
            self.setupTableViewDataSourceDelegate()
            self.tableView.reloadData()
        }
    }
    
    func presentPreOrder(itemsCount: Int, total: String) {
        if itemsCount == 0 {
            preOrderView.isHidden = true
            totalItemsLabel.text = ""
            totalValueLabel.text = ""
        } else {
            preOrderView.isHidden = false
            totalItemsLabel.text = "TOTAL (\(itemsCount) items)"
            totalValueLabel.text = total
        }
    }
    //AddButtonPressing
    func didTapAddButton(index: Int) {
        vm.didSelectItem(index: index)
    }
}
