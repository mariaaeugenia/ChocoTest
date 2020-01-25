//
//  ProductTableViewCell.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit


class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(viewModel: ProductCellViewModel) {
        let path = viewModel.getPhoto()
        let url = URL(string: path)
        productImageView.load(url: url, placeholder: "placeholder")
        nameLabel.text = viewModel.getName()
        priceLabel.text = viewModel.priceCurreny()
        if viewModel.isCheked {
            checkImage.isHidden = false
        } else {
            checkImage.isHidden = true
        }
    }
    
}
