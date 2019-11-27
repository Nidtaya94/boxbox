//
//  UIScrollView+Extension.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//
import UIKit

extension UIScrollView {
  
  func setupScrollDefault() {
    isScrollEnabled = false
    showsHorizontalScrollIndicator = false
    showsVerticalScrollIndicator = false
    bounces = false
    alwaysBounceVertical = false
    alwaysBounceHorizontal = false
  }
  
  func setupScrollHorizontal() {
    setupScrollDefault()
    alwaysBounceHorizontal = true
    showsHorizontalScrollIndicator = false
  }
  
  func setupScrollVertical() {
    setupScrollDefault()
    isScrollEnabled = true
    showsVerticalScrollIndicator = false
    bounces = true
    alwaysBounceVertical = true
  }

}
