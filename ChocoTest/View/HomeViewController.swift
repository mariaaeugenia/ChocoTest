//
//  HomeViewController.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var preOrderView: UIView!
    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    
    let viewModel = ProductsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.delegate = self
        viewModel.viewModelDidLoad()
    }
    
    func setupTableView() {
        let nib = UINib(nibName: "ProductTableViewCell",bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "CELL")
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
    }

}
    
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0

        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let closeAction = UIContextualAction(style: .normal, title:  "ADD", handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self?.viewModel.didSelectItem(index: indexPath.row)
            success(true)
        })
        closeAction.backgroundColor = UIColor(hexString: "007AFF")
        return UISwipeActionsConfiguration(actions: [closeAction])
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let modifyAction = UIContextualAction(style: .normal, title:  "Delete", handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self?.viewModel.didDeselectItem(index: indexPath.row)
            success(true)
        })
        modifyAction.backgroundColor = .red
    
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        let vm = viewModel.cellForIndex(index: indexPath.row)
        cell.configureCell(viewModel: vm)
        cell.addButton.tag = indexPath.row
        cell.accessoryType = .detailButton
        return cell
    }
}

extension HomeViewController: ProductsPresentable, AddButtonPressing {
    
    func setLoading(isLoading: Bool) {
        DispatchQueue.main.async {
            if isLoading {
                LoadingView.shared.showLoading()
            } else {
                LoadingView.shared.hideLoading()
            }
        }
    }
    
    func didTapAddButton(index: Int) {
        viewModel.didSelectItem(index: index)
    }
    
    func presentError(message: String) {
        self.presentAlert(title: "Error", message: message, completion:{_ in })
    }
    
    func presentList() {
        DispatchQueue.main.async {
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
}
