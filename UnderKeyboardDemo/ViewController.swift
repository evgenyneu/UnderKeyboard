//
//  ViewController.swift
//  UnderKeyboardDemo
//
//  Created by Evgenii Neumerzhitckii on 24/03/2015.
//  Copyright (c) 2015 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var textView: UITextView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    UnderKeyboard.scrollView(textView)
  }
  
  @IBAction func onDoneTapped(sender: AnyObject) {
    textView.resignFirstResponder()
  }
}

