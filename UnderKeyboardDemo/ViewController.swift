//
//  ViewController.swift
//  UnderKeyboardDemo
//
//  Created by Evgenii Neumerzhitckii on 24/03/2015.
//  Copyright (c) 2015 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var textField: UITextField!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    UnderKeyboard.scrollView(scrollView)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func onDoneTapped(sender: AnyObject) {
    textField.resignFirstResponder()
  }
}

