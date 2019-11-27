//
//  LoadingView.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

import MaterialComponents.MaterialActivityIndicator

extension LoadingView:
  ViewApplicable,
  UIGestureRecognizerDelegate
{
  
}

class LoadingView: UIScrollView {

  var contentView: UIView = {
    let view = UIView()
    return view
  }()
  let activityIndicator: MDCActivityIndicator = {
    let activityIndicator = MDCActivityIndicator()
    activityIndicator.sizeToFit()
    activityIndicator.indicatorMode = .indeterminate
    activityIndicator.radius = UIConstant.mediumSpace
    return activityIndicator
  }()
  
  convenience init() {
    self.init(frame: .zero)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupScrollVertical()
    addSubviews([contentView])
    contentView.addSubviews([activityIndicator])
    applyView()
    activityIndicator.startAnimating()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func applyAutoLayout() {
    contentView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.right.equalTo(snp.right)
      $0.left.equalTo(snp.left)
      $0.width.equalToSuperview()
      $0.height.equalToSuperview()
    }
    activityIndicator.snp.makeConstraints {
      $0.width.equalTo(snp.width).multipliedBy(0.15)
      $0.height.equalTo(activityIndicator.snp.width)
      $0.center.equalToSuperview()
    }
  }
  
  func applyProperty() {
    contentInsetAdjustmentBehavior = .always
    isHidden = true
  }
  
  func applyLocalize() {
    
  }
  
  func applyStyle() {
    backgroundColor = .clear
    contentView.backgroundColor = .clear
  }
  
}
