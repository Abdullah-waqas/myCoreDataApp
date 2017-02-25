//
//  ProductTableViewCell.swift
//  myCoreDataApp
//
//  Created by Abdullah on 23/02/2017.
//  Copyright © 2017 Abdullah. All rights reserved.
//

import UIKit
import CoreData

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func  configureCell(product: Product){
        self.productName.text = "\(product.productName!)"
        self.productDescription.text = product.productDescription!
        self.productImage.image = UIImage(data: product.productImage as! Data)
    }

}
