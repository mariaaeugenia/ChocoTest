//
//  ProductsTableView.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 22/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class ProductsTableView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.alpha = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView = UITableView()
    
    init() {
        super.init(frame: .zero)
        addSubview(contentView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        tableView.separatorColor = .clear
        tableView.backgroundColor = .clear
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "CELL")
        contentView.addSubview(tableView)
        tableView.frame = self.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
}

extension ProductsTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
