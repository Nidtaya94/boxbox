//
//  BookingFormCalendarVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

extension BookingFormCalendarVC:
  ViewApplicable
{
  
}

class BookingFormCalendarVC: UIViewController {
  
  var backBarButtonItem: UIBarButtonItem = {
    let barButtonItem = UIFactory.backBarButtonItem
    return barButtonItem
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItems = [backBarButtonItem]
    applyView()
  }
  
  func applyAutoLayout() {
    
  }
  
  func applyProperty() {
    backBarButtonItem.addTargetForAction(self, action: #selector(buttonTouchUpInside))
  }
  
  func applyLocalize() {
    navigationItem.title = String(describing: Self.self)
  }
  
  func applyStyle() {
    view.backgroundColor = colorScheme.backgroundColor
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    switch sender {
    case backBarButtonItem:
      dismiss(animated: true)
    default:
      break
    }
  }
  
}

