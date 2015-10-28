//
//  CartManager.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation
import RealmSwift

class CartItem:Object {
    dynamic var name = ""
}

class CartManager {
    static let sharedManager = CartManager()
    
    var items : Results<CartItem>!
    
    var count : Int {
        if items==nil {
            return 0
        }
        else {
            return items.count
        }
    }
    
    func retrieveCart() {
        let realm = try! Realm()
        items = realm.objects(CartItem)
    }
    
    func cartAt(index : Int) -> String {
        return items[index].name
    }
    
    func addCart(cart : String) {
        let realm = try! Realm()
        let cartItem = CartItem()
        cartItem.name = cart
        
        try! realm.write {
            realm.add(cartItem)
        }
        
        let request = RequestController.sharedManger
        request.sendRequestPOST(cart)
    }
    
    func removeCart(){
        let realm = try! Realm()
        
        try! realm.write {
            realm.deleteAll()
        }
    }
}
