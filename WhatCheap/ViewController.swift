//
//  FirstViewController.swift
//  WhatCheap
//
//  Created by kamontat chantrachirathumrong on 11/15/2559 BE.
//  Copyright © 2559 kamontat chantrachirathumrong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var resetBtn: UIButton!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var quantityField: UITextField!
    
    let db = Database.getDatabase()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setBorder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        if checkBlankField() {
            return
        }
        
        db.add(product: Product(name: nameField.text!, price: Int(priceField.text!)!, quantity: Int(quantityField.text!)!))
        db.printAllProduct()
        print("")
        
        resetField()
    }
    
    @IBAction func resetAction(_ sender: UIButton) {
        db.removeAll()
    }
    
    private func setBorder() {
        addBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.05)
        addBtn.layer.cornerRadius = 9
        addBtn.layer.borderWidth = 1.5
        addBtn.layer.borderColor = UIColor.blue.cgColor
        
        resetBtn.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.05)
        resetBtn.layer.cornerRadius = 9
        resetBtn.layer.borderWidth = 1.5
        resetBtn.layer.borderColor = UIColor.red.cgColor
    }
    
    private func checkBlankField() -> Bool {
        var errorText: String = "Please Enter "
        var isError: Bool = false
        
        if nameField.text == nil {
            errorText.append("\"Name\" ")
            isError = true
        }
        
        if priceField.text == nil {
            errorText.append("\"Price\" ")
            isError = true
        }
        
        if quantityField.text == nil {
            errorText.append("\"Quantity\" ")
            isError = true
        }
        
        if isError {
            let error = UIAlertController(title: "Must enter all 3 field", message: errorText, preferredStyle: .alert)
            error.addAction(UIAlertAction(title: "Understand!", style: .cancel))
            self.present(error, animated: true)
        }
        return isError
    }
    
    private func resetField() {
        nameField.text = nil
        priceField.text = nil
        quantityField.text = nil
    }
}
