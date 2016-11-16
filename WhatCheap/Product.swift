//
//  Product.swift
//  WhatCheap
//
//  Created by kamontat chantrachirathumrong on 11/15/2559 BE.
//  Copyright © 2559 kamontat chantrachirathumrong. All rights reserved.
//

import Foundation

class Product: CustomStringConvertible {
    static var i = 1;
    var name: String
    var price: Int
    var priceUnit: String
    var quantity: Int
    var quantityUnit: String
    
    var timeStamp: String
    
    
    var description: String {
        return "\(name): \(getCostString()) :: \(getAverageString())"
    }
    
    var average: Double {
        get {
            let average = String(format: "%.2f", Double(price) / Double(quantity))
            return Double(average)!
        }
    }
    
    init(price: Int, priceUnit: String, quantity: Int, quantityUnit: String) {
        self.name = "Unname Product(\(Product.i))"
        self.price = price
        self.priceUnit = priceUnit
        self.quantity = quantity
        self.quantityUnit = quantityUnit
        Product.i += 1
        
        timeStamp = Product.getCurrentTime()
    }
    
    init(name: String, price: Int, priceUnit: String, quantity: Int, quantityUnit: String) {
        self.name = name
        self.price = price
        self.priceUnit = priceUnit
        self.quantity = quantity
        self.quantityUnit = quantityUnit
        
        timeStamp = Product.getCurrentTime()
    }
    
    func equals(other: Product) -> Bool {
        return other.name == name
    }
    
    func equals(otherName: String) -> Bool {
        return otherName == name
    }
    
    func getCostString() -> String {
        return "\(price) \(priceUnit) : \(quantity) \(quantityUnit)"
    }
    
    func getAverageString () -> String {
        return "\(average) \(priceUnit)/\(quantityUnit)"
    }
    
    
    /// get current time in format "MM/DD/YY, HH:MM AM"
    ///
    /// - Returns: String of crrent date
    class func getCurrentTime() -> String {
        // get the current date and time
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .long
        formatter.dateStyle = .long
        
        // get the date time String from the date object
        return formatter.string(from: currentDateTime)
    }
}
