//
//  ProductCell.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit

protocol ProductCellDelegate : class {
    func addCart(productCode : String)
}

class ProductCell: UITableViewCell {
    
    weak var delegate : ProductCellDelegate!
    
//    @IBAction func addButtonClicked(sender: AnyObject) {
//        delegate.addCart(productCode)
//    }
    
    
    @IBAction func addButtonClicked(sender: AnyObject) {
        delegate.addCart(productCode)
    }
    
    var productCode : String!
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
}

