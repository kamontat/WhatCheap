//
//  Product.swift
//  WhatCheap
//
//  Created by kamontat chantrachirathumrong on 11/15/2559 BE.
//  Copyright © 2559 kamontat chantrachirathumrong. All rights reserved.
//

import Foundation

class Product {
    var name: String
    var price: Int
    var quantity: Int
    
    var average: Double {
        get {
            return Double(price) / Double(quantity)
        }
    }
    
    init(name: String, price: Int, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
    func toString() -> String {
        return "\(name): \(price) , \(quantity)"
    }
}
