//
//  BookingVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 17/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

extension BookingVC
{
  
}

class BookingVC: UIViewController {
  
  var dummyText: String?
  
  let dummyLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    return label
  }()
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(dummyLabel)
    dummyLabel.snp.makeConstraints {
      $0.right.equalTo(view.snp.rightMargin)
      $0.left.equalTo(view.snp.leftMargin)
      $0.center.equalToSuperview()
    }
    dummyLabel.text = dummyText
    applyProperties()
    applyTheme()
  }
  
  func applyProperties() {
    navigationItem.title = String(describing: Self.self)
  }
  
  func applyTheme() {
//    view.backgroundColor = colorScheme.backgroundColor
    view.backgroundColor = .white
    setNeedsStatusBarAppearanceUpdate()
  }
  
}
