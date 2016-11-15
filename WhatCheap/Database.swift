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
    
    func add(product: Product) {
        products.append(product)
    }
    
    func removeAll() {
        products.removeAll()
    }
    
    func getAllProduct() -> [Product] {
        return products
    }
    
    func printAllProduct() {
        products.forEach { product in
            print(product.toString())
        }
    }
}
