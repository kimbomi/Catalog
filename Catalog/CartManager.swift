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
    let realm = try! Realm()
    
    var count : Int {
        return realm.objects(CartItem).count
        
    }
    
    func cartAt(index : Int) -> String {
        return realm.objects(CartItem)[index].name
    }
    
    func addCart(cart : String) {
        let cartItem = CartItem()
        cartItem.name = cart
        
        try! realm.write {
            self.realm.add(cartItem)
        }
    }
}
