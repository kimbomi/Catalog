//
//  ViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UITableViewDataSource, UITableViewDelegate,
    ProductCellDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var section = 2
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Catalog"
        } else {
            return "Cart"
        }
    }
    
    func addCart(productCode: String) {
        cartList.insert(productCode, atIndex: 0)
        tableView.reloadData()
    }
    
    var productList : [Product]!
    var cartList = [String]()
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return section
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return productList.count
        } else  {
            return cartList.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        
            let cell : ProductCell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL", forIndexPath: indexPath) as! ProductCell
            
            let product = productList[indexPath.row]
            cell.productName.text = product.name
            cell.productPrice.text = product.price
            cell.productImage.image = UIImage(named: product.image)
        
            cell.productCode = product.code
        
            cell.delegate = self
        
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("CART_CELL")!
            
            let itemName = cartList[indexPath.row]
            cell.textLabel?.text = itemName
            
            return cell

        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        productList = [
            Product(code: "001", name: "baseball", price: "100", image: "baseball"),
            Product(code: "001", name: "basketball", price: "100", image: "basketball"),
            Product(code: "002", name: "basketball", price: "200", image: "basketball"),
            Product(code: "003", name: "football", price: "300", image: "football"),
            Product(code: "004", name: "golf", price: "400", image: "golf"),
            Product(code: "005", name: "rugby", price: "500", image: "rugby"),
            Product(code: "006", name: "tennis", price: "600", image: "tennis"),
            Product(code: "007", name: "volleyball", price: "700", image: "volleyball"),
            Product(code: "008", name: "tableTennis", price: "800", image: "tableTennis"),
            Product(code: "009", name: "iceHocky", price: "800", image: "iceHocky"),
            Product(code: "010", name: "billiard", price: "800", image: "billiard"),
        ]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

