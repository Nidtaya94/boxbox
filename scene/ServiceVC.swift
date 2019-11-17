//
//  ServiceVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

extension ServiceVC:
  ProductViewDelegate
{
  
}

class ServiceVC: UIViewController {
  
  let serviceScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.contentInsetAdjustmentBehavior = .always
    scrollView.setupScrollDefault()
    scrollView.setupScrollVertical()
    scrollView.contentInset = UIEdgeInsets(top: UIConstant.mediumSpace,
                                           left: 0,
                                           bottom: UIConstant.mediumSpace,
                                           right: 0)
    return scrollView
  }()
  
  let serviceStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = UIConstant.mediumSpace
    return stackView
  }()

  var hotelProductView: ProductView = {
    let view = ProductView()
    return view
  }()
  
  var spaProductView: ProductView = {
    let view = ProductView()
    return view
  }()
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hotelProductView.delegate = self
    spaProductView.delegate = self
    view.addSubview(serviceScrollView)
    serviceScrollView.addSubview(serviceStackView)
    serviceStackView.addArrangedSubview(hotelProductView)
    serviceStackView.addArrangedSubview(spaProductView)
    serviceScrollView.snp.makeConstraints {
      $0.top.equalTo(self.view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(self.view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
    serviceStackView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.left.equalTo(self.view.snp.leftMargin)
      $0.bottom.equalToSuperview()
      $0.right.equalTo(self.view.snp.rightMargin)
    }
    hotelProductView.snp.makeConstraints {
      $0.height.equalTo(hotelProductView.snp.width)
    }
    spaProductView.snp.makeConstraints {
      $0.height.equalTo(hotelProductView.snp.width)
    }
    applyProperties()
    applyTheme()
    var d = ProductViewDisplayed()
    d.imageURL = URL(string: "")
    d.iconImage = UIImage(color: .black, size: CGSize(width: 1, height: 1))
    d.title = "Spa & Salon"
    d.subtitle = nil
    hotelProductView.populate(d)
    spaProductView.populate(d)
  }
  
  func applyProperties() {
    navigationItem.title = String(describing: Self.self)
  }
  
  func applyTheme() {
    view.backgroundColor = colorScheme.backgroundColor
    hotelProductView.backgroundColor = .red
    hotelProductView.infomationView.backgroundColor = .blue
    hotelProductView.actionButton.setBackgroundImage(UIImage(color: .black, size: CGSize(width: 1, height: 1)),
                                                     for: [])
    hotelProductView.titleLabel.backgroundColor = .yellow
    hotelProductView.subtitleLabel.backgroundColor = .green
    
    spaProductView.backgroundColor = .red
    spaProductView.infomationView.backgroundColor = .blue
    spaProductView.actionButton.setBackgroundImage(UIImage(color: .black, size: CGSize(width: 1, height: 1)),
    for: [])
    spaProductView.titleLabel.backgroundColor = .yellow
    spaProductView.subtitleLabel.backgroundColor = .green
    setNeedsStatusBarAppearanceUpdate()
  }
  
  func productView(didSelectItemAt index: Int) {
    print(#function, index)
    let vc = ServiceDetailVC()
    navigationController?.pushViewController(vc, animated: true)
  }
  
}
