//
//  AbstractTableViewDataSource.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 24/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class AbstractTableViewDataSource<Cell: UITableViewCell>: NSObject, UITableViewDataSource {
    
    var numberOfItems: Int
    var configure: (Cell, Int) -> Void
    var identifier: String
    
    init(numberOfItems: Int = 0, identifier: String = "", configure: @escaping (Cell, Int) -> Void = {_, _ in }) {
        self.numberOfItems = numberOfItems
        self.configure = configure
        self.identifier = identifier
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //1
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfItems
    }
    //2
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell else { return UITableViewCell() }
        configure(cell, indexPath.row)
        return cell
    }
    
}
