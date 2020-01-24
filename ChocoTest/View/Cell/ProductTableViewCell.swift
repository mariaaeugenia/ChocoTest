//
//  ProductTableViewCell.swift
//  ChocoTest
//
//  Created by Maria Eugênia Pereira Teixeira on 23/01/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit
import Kingfisher

protocol AddButtonPressing {
    func didTapAddButton(index: Int)
}

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    var delegate: AddButtonPressing?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let radius = addButton.frame.height/2
        addButton.applyGradientLayer(with: radius)
    }
    
    func configureCell(viewModel: ProductCellViewModel) {
        let path = viewModel.getPhoto()
        let url = URL(string: path)
        productImageView.load(url: url, placeholder: "placeholder")
        nameLabel.text = viewModel.getName()
        priceLabel.text = viewModel.priceCurreny()
    }

    @IBAction func addButtonAction(_ sender: UIButton) {
        delegate?.didTapAddButton(index: sender.tag)
    }
    
}
