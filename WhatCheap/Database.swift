//
//  Database.swift
//  WhatCheap
//
//  Created by kamontat chantrachirathumrong on 11/15/2559 BE.
//  Copyright © 2559 kamontat chantrachirathumrong. All rights reserved.
//

import Foundation

class Database {
    private var products: [Product] = [Product]()
    
    private static var db = Database();
    
    private init() {
    }
    
    class func getDatabase() -> Database {
        return db
    }
    
    func productEquals(otherName: String) -> Product? {
        for product in products {
            if product.equals(otherName: otherName) {
                return product
            }
        }
        return nil
    }
    
    func indexEquals(otherName: String) -> Int {
        var i = 0
        for product in products {
            if product.equals(otherName: otherName) {
                return i
            }
            i += 1
        }
        return -1
    }
    
    func add(product: Product) {
        let i = indexEquals(otherName: product.name)
        if i != -1 {
            products.remove(at: i)
        }
        
        products.append(product)
    }
    
    func removeAll() {
        products.removeAll()
    }
    
    func getCountProduct() -> Int {
        return products.count
    }
    
//    func getAllProduct() -> [Product] {
//        return products
//    }
    
    func printAllProduct() {
        products.forEach { product in
            print(product.toString())
        }
    }
}
