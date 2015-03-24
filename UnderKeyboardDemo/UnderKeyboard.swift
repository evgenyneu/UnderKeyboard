//
//  UnderKeyboard.swift
//  UnderKeyboardDemo
//
//  Created by Evgenii Neumerzhitckii on 24/03/2015.
//  Copyright (c) 2015 The Exchange Group Pty Ltd. All rights reserved.
//

import UIKit

let tegUnderKeyboard = UnderKeyboard()

@objc
class UnderKeyboard {
  
  weak var scrollView: UIScrollView?
  
  class var shared: UnderKeyboard {
    return tegUnderKeyboard
  }
  
  private init() {
    registerForKeyboardNotifications()
  }
  
  deinit {
    unRegisterForKeyboardNotifications()
  }
  
  private func registerForKeyboardNotifications() {
    NSNotificationCenter.defaultCenter().addObserver(self,
      selector: "keyboardDidShow:",
      name: UIKeyboardDidShowNotification, object: nil)
  }
  
  private func unRegisterForKeyboardNotifications() {
    NSNotificationCenter.defaultCenter().removeObserver(self)
  }
  
  func keyboardDidShow(notification: NSNotification) {
    if let currentUserInfo = notification.userInfo {
      if let value = currentUserInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue {
        let height = value.CGRectValue().size.height
        
        let insets =  UIEdgeInsets(
          top: 0,
          left: 0,
          bottom: height,
          right: 0)
        
        scrollView?.contentInset = insets
        scrollView?.scrollIndicatorInsets = insets
      }
    }
  }
}