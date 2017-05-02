//
//  ViewController.swift
//  SwizTest
//
//  Created by Andart on 02.05.17.
//  Copyright © 2017 Andart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.label.text = "test_string"
        self.textField.text = "test_string"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

