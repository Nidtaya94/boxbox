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

extension BookingVC:
  ViewApplicable
{
  
}

class BookingVC: UIViewController {
  
  var cardView: CardView = {
    let view = CardView()
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubviews([cardView])
    applyView()
    fetchBooking()
  }
  
  func applyAutoLayout() {
    cardView.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
    }
  }
  
  func applyProperty() {
    
  }
  
  func applyLocalize() {
    navigationItem.title = String(describing: Self.self)
  }
  
  func applyStyle() {
    view.backgroundColor = colorScheme.backgroundColor
//    cardView.backgroundColor = .red
  }
  
}

extension BookingVC {
  
  func fetchBooking() {
    var d = CardViewModel()
    d.key = "KEY"
    d.value = "VALUE"
    cardView.applyModel(d)
  }
  
}
