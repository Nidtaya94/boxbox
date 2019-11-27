//
//  BookingFormGuestVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

extension BookingFormGuestVC:
  ViewApplicable,
  GuestDetailViewDelegate
{
  
}

class BookingFormGuestVC: UIViewController {
  
  var backBarButtonItem: UIBarButtonItem = {
    let barButtonItem = UIFactory.backBarButtonItem
    return barButtonItem
  }()
  
  var guestDetailView: GuestDetailView = {
    let view = GuestDetailView()
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItems = [backBarButtonItem]
    view.addSubviews([guestDetailView])
    applyView()
  }
  
  func applyAutoLayout() {
    guestDetailView.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(100)
    }
  }
  
  func applyProperty() {
    backBarButtonItem.addTargetForAction(self, action: #selector(buttonTouchUpInside))
    guestDetailView.delegate = self
  }
  
  func applyLocalize() {
    navigationItem.title = String(describing: Self.self)
  }
  
  func applyStyle() {
    view.backgroundColor = colorScheme.backgroundColor
    guestDetailView.backgroundColor = .gray
    guestDetailView.countLabel.backgroundColor = .lightGray
    guestDetailView.titleLabel.backgroundColor = .lightGray
    guestDetailView.subtitleLabel.backgroundColor = .lightGray
    guestDetailView.minusButton.setBackgroundImage(UIFactory.placeHolderImage, for: [])
    guestDetailView.plusButton.setBackgroundImage(UIFactory.placeHolderImage, for: [])
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    switch sender {
    case backBarButtonItem:
      dismiss(animated: true)
    default:
      break
    }
  }
  
  func guestDetailView(_ view: UIView, tag: Int) {
    
  }
  
}
