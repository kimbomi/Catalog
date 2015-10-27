//
//  ProductManeger.swift
//  Catalog
//
//  Created by sdt5 on 2015. 10. 26..
//  Copyright © 2015년 tacademy. All rights reserved.
//

import Foundation

class ProductManager {
    static let sharedManager = ProductManager()
    
    var productList = [
        Product(code: "001", name: "baseball", price: "100", image: "baseball"),
        Product(code: "002", name: "basketball", price: "200", image: "basketball"),
        Product(code: "003", name: "football", price: "300", image: "football"),
        Product(code: "004", name: "golf", price: "400", image: "golf"),
        Product(code: "005", name: "rugby", price: "500", image: "rugby"),
        Product(code: "006", name: "tennis", price: "600", image: "tennis"),
        Product(code: "007", name: "volleyball", price: "700", image: "volleyball"),
        Product(code: "008", name: "tableTennis", price: "800", image: "tableTennis"),
        Product(code: "009", name: "iceHockey", price: "800", image: "iceHockey"),
        Product(code: "010", name: "billiard", price: "800", image: "billiard"),
    ]
    
    var count : Int {
        return productList.count
    }
    
    func productAt(index : Int) -> Product {
        return productList[index]
    }
}