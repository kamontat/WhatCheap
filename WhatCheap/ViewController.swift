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
    @IBOutlet weak var priceUnitField: UITextField!
    @IBOutlet weak var quantityField: UITextField!
    @IBOutlet weak var quantityUnitField: UITextField!
    
    let db = Database.getDatabase()

    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
        setBorder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func nameTyping(_ sender: UITextField) {
        checkEquals()
    }
    
    @IBAction func addAction(_ sender: UIButton) {
        if checkBlankField() {
            return
        }
        
        let price = Int(priceField.text!)!
        let priceUnit = priceUnitField.text!
        let quantity = Int(quantityField.text!)!
        let quantityUnit = quantityUnitField.text!
        
        if nameField.text == nil || nameField.text! == "" {
            db.add(product: Product(price: price, priceUnit: priceUnit, quantity: quantity, quantityUnit: quantityUnit))
            
        } else {
            let name = nameField.text!
            db.add(product: Product(name: name, price: price, priceUnit: priceUnit, quantity: quantity, quantityUnit: quantityUnit))
        }
        
        db.printAllProduct()
        print("")
        
        resetField()
        UnitChange()
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
        var errorText: String = "Enter "
        var isError: Bool = false
        
        if priceField.text == nil || priceField.text == "" {
            errorText.append("\"Price\", ")
            isError = true
        }
        
        if quantityField.text == nil || quantityField.text == ""{
            errorText.append("\"Quantity\", ")
            isError = true
        }
        
        if isError {
            let error = UIAlertController(title: "Must enter All necessary field", message: errorText, preferredStyle: .alert)
            error.addAction(UIAlertAction(title: "Understand!", style: .cancel))
            self.present(error, animated: true)
        }
        return isError
    }
    
    private func checkEquals() {
        let name = nameField.text!
        let productTemp = db.productEquals(otherName: name)
        // load all data
        if productTemp != nil {
            priceField.text = String(productTemp!.price)
            quantityField.text = String(productTemp!.quantity)
            if isUnitCanChange() {
                priceUnitField.text = productTemp!.priceUnit
                quantityUnitField.text = productTemp!.quantityUnit
            }
        } else {
            priceField.text = ""
            quantityField.text = ""
            
            if isUnitCanChange() {
                priceUnitField.text = "Baht"
                quantityUnitField.text = "Piece"
            }
        }
    }
    
    private func UnitChange() {
        if db.getCountProduct() != 0 {
            if priceUnitField.isEnabled {
                priceUnitField.text = "\"\(priceUnitField.text!)\""
                priceUnitField.isEnabled = false
            }
            if quantityUnitField.isEnabled {
                quantityUnitField.text = "\"\(quantityUnitField.text!)\""
                quantityUnitField.isEnabled = false
            }
        }
    }
    
    private func isUnitCanChange() -> Bool {
        return quantityUnitField.isEnabled || priceUnitField.isEnabled
    }
    
    private func resetField() {
        nameField.text = nil
        priceField.text = nil
        quantityField.text = nil
    }
}

extension UIViewController {
    func hiddenKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardView))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    func dismissKeyboardView() {
        view.endEditing(true)
    }
}
