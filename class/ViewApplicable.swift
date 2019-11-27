//
//  ViewApplicable.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//


import Foundation

protocol ViewApplicable {
  func applyAutoLayout()
  func applyProperty()
  func applyLocalize()
  func applyStyle()
}

extension ViewApplicable {
  
  func applyView() {
    applyAutoLayout()
    applyProperty()
    applyLocalize()
    applyStyle()
  }
  
}
