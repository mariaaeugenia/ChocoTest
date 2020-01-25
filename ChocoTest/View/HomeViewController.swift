//
//  HomeViewController.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class HomeViewController: AbstractViewController<HomeViewModel> {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var preOrderView: UIView!
    @IBOutlet weak var preOrderHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    
    var dataSource = AbstractTableViewDataSource<ProductTableViewCell>()
    
    var panGesture = UIPanGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableViewCell()
        vm.delegate = self
        vm.productDelegate = self
        vm.viewModelDidLoad()
        DispatchQueue.main.async {
            self.setupSwipe()
            self.setupOrderView()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        panGesture.cancelsTouchesInView = true
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
            cell.accessoryType = .detailButton
        })
        dataSource = newDataSource
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    func setupSwipe() {
        panGesture.addTarget(self, action: #selector(didSwipe(_:)))
        preOrderView.addGestureRecognizer(panGesture)
        preOrderView.isUserInteractionEnabled = true
    }
    
    @objc func didSwipe(_ gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .changed:
            if preOrderHeightConstraint.constant > 69 {
                let translation = gestureRecognizer.translation(in: self.view).y
                preOrderHeightConstraint.constant = 100 - translation
                if preOrderHeightConstraint.constant > 150 {
                    orderButton.alpha = -translation*0.1
                    orderButton.isHidden = false
                } else {
                    orderButton.alpha = 0
                    orderButton.isHidden = true
                }
            } else {
                orderButton.alpha = 0
                orderButton.isHidden = true
            }
        case .ended:
            if preOrderHeightConstraint.constant < 100 {
                preOrderHeightConstraint.constant = 100
            } else if preOrderHeightConstraint.constant > 190 {
                preOrderHeightConstraint.constant = 190
            }
        default:
            break
        }
    }
    
    func setupOrderView() {
        let rect = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200)
        let radius: CGFloat = 40
        preOrderView.roundCorners(corners: [.topLeft, .topRight], radius: radius, and: rect)
        preOrderView.applyGradientLayer(with: radius, and: rect)
    }
    
    func clear() {
        orderButton.alpha = 0
        orderButton.isHidden = true
        preOrderHeightConstraint.constant = 100
        preOrderView.isHidden = true
        vm.clearProductsSelected()
    }
    
    //MARK: - BUTTONS ACTION
    @IBAction func orderButtonPressed(_ sender: Any) {
        vm.perfomeOrder()
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
        let modifyAction = UIContextualAction(style: .normal, title:  "Remove", handler: { [weak self] (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            self?.vm.didDeselectItem(index: indexPath.row)
            success(true)
        })
        modifyAction.backgroundColor = .red
        
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let desc = vm.didTapDetailButton(index: indexPath.row)
        self.presentAlert(title: "Description", message: desc, completion: {_ in})
    }
    
}

extension HomeViewController: Presentable, ProductsBusinessLogic {
    //Presentable
    func setLoading(isLoading: Bool) {
        DispatchQueue.main.async {
            if isLoading {
                LoadingView.shared.showLoading()
            } else {
                LoadingView.shared.hideLoading()
                if self.vm.isFirstTime() {
                    let screenSize = UIScreen.main.bounds
                    let view = OnBoardingView(frame: screenSize)
                    self.tabBarController?.view.addSubview(view)
                }
            }
        }
    }
    
    func presentError(message: String) {
        DispatchQueue.main.async {
            self.presentAlert(title: "Error", message: message, completion:{_ in })
        }
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
        tableView.reloadRows(at: [IndexPath(row: vm.index, section: 0)], with: .automatic)
    }
    
    func didOrder() {
        DispatchQueue.main.async {
            self.presentAlert(title: "Alert", message: "Order placed with success", completion:{_ in })
            self.clear()
        }
    }
}

