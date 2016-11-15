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
    var priceUnit: String
    var quantity: Int
    var quantityUnit: String
    
    var average: Double {
        get {
            return Double(price) / Double(quantity)
        }
    }
    
    init(name: String, price: Int, priceUnit: String, quantity: Int, quantityUnit: String) {
        self.name = name
        self.price = price
        self.priceUnit = priceUnit
        self.quantity = quantity
        self.quantityUnit = quantityUnit
    }
    
    func toString() -> String {
        return "\(name): \(price) \(priceUnit), \(quantity) \(quantityUnit) :: \(average) \(priceUnit)/\(quantityUnit)"
    }
}
