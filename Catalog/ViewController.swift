//
//  ViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 22..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UITableViewDataSource, UITableViewDelegate, ProductCellDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    let productManager = ProductManager.sharedManager
    let cartManager = CartManager.sharedManager
    
    func addCart(productCode: String) {
        cartManager.addCart(productCode)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPathForCell(cell)!
        let selected  = productManager.productAt(indexPath.row)
        print("selected data : \(selected.name)")
        
        let detailVC = segue.destinationViewController as! DetailViewController
        detailVC.urlStr = selected.name
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Catalog"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productManager.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            self.tableView.rowHeight = 60.0
            
            let cell : ProductCell = tableView.dequeueReusableCellWithIdentifier("PRODUCT_CELL", forIndexPath: indexPath) as! ProductCell
            
            let product = productManager.productAt(indexPath.row)
            cell.productName.text = product.name
            cell.productPrice.text = product.price
            cell.productImage.image = UIImage(named: product.image)
        
            cell.productCode = product.code
        
            cell.delegate = self
        
            return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

