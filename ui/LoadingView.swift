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
    activityIndicator.radius = 18.0
    return activityIndicator
  }()
  
  convenience init() {
    self.init(frame: .zero)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentInsetAdjustmentBehavior = .always
    setupScrollDefault()
    setupScrollVertical()
    addSubview(contentView)
    contentView.addSubview(activityIndicator)
    contentView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.right.equalTo(self.snp.right)
      $0.left.equalTo(self.snp.left)
      $0.width.equalToSuperview()
      $0.height.equalToSuperview()
    }
    activityIndicator.snp.makeConstraints {
      $0.width.equalTo(self.snp.width).multipliedBy(0.15)
      $0.height.equalTo(activityIndicator.snp.width)
      $0.center.equalToSuperview()
    }
    applyProperties()
    applyTheme()
    isHidden = true
    activityIndicator.startAnimating()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func applyProperties() {
    
  }
  
  func applyTheme() {
    backgroundColor = .clear
    contentView.backgroundColor = .clear
  }
  
}
