//
//  ProductTableViewCell.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addButton.applyGradientLayer()
    }
    
    func configureCell(viewModel: ProductCellViewModel) {
        if let url = URL(string: viewModel.photo) {
            productImageView.kf.setImage(with: url)
        }
        nameLabel.text = viewModel.name
        priceLabel.text = viewModel.priceCurreny()
    }

    
}
