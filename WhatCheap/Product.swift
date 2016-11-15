//
//  Product.swift
//  WhatCheap
//
//  Created by kamontat chantrachirathumrong on 11/15/2559 BE.
//  Copyright © 2559 kamontat chantrachirathumrong. All rights reserved.
//

import Foundation

class Product {
    static var i = 1;
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
    
    init(price: Int, priceUnit: String, quantity: Int, quantityUnit: String) {
        self.name = "Unname Product(\(Product.i))"
        self.price = price
        self.priceUnit = priceUnit
        self.quantity = quantity
        self.quantityUnit = quantityUnit
        Product.i += 1
    }
    
    init(name: String, price: Int, priceUnit: String, quantity: Int, quantityUnit: String) {
        self.name = name
        self.price = price
        self.priceUnit = priceUnit
        self.quantity = quantity
        self.quantityUnit = quantityUnit
    }
    
    func equals(other: Product) -> Bool {
        return other.name == name
    }
    
    func equals(otherName: String) -> Bool {
        return otherName == name
    }
    
    func toString() -> String {
        return "\(name): \(price) \(priceUnit), \(quantity) \(quantityUnit) :: \(average) \(priceUnit)/\(quantityUnit)"
    }
}
