//
//  ProfileVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

extension ProfileVC:
  ViewApplicable
{
  
}

class ProfileVC: UIViewController {
  
  var dummyText: String?
  
  var dummyLabel: UILabel = {
    let label = UIFactory.dummyLabel
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(dummyLabel)
    applyView()
  }
  
  func applyAutoLayout() {
    dummyLabel.snp.makeConstraints {
      $0.right.equalTo(view.snp.rightMargin)
      $0.left.equalTo(view.snp.leftMargin)
      $0.center.equalToSuperview()
    }
  }
  
  func applyProperty() {
    
  }
  
  func applyLocalize() {
    navigationItem.title = String(describing: Self.self)
    dummyLabel.text = dummyText
  }
  
  func applyStyle() {
    view.backgroundColor = colorScheme.backgroundColor
  }
  
}
