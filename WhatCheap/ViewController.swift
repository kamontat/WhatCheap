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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 1, alpha: 0.1)
        addBtn.layer.cornerRadius = 9
        addBtn.layer.borderWidth = 1.5
        addBtn.layer.borderColor = UIColor.blue.cgColor
        
        resetBtn.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.1)
        resetBtn.layer.cornerRadius = 9
        resetBtn.layer.borderWidth = 1.5
        resetBtn.layer.borderColor = UIColor.red.cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
