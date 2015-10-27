//
//  CartViewController.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tacademy. All rights reserved.
//
import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let cartManager = CartManager.sharedManager
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cart"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartManager.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellCart = tableView.dequeueReusableCellWithIdentifier("CART_CELL")!
        cellCart.textLabel?.text = cartManager.cartAt(indexPath.row)
        
        return cellCart
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
