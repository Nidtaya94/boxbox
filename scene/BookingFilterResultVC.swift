//
//  BookingFilterResultVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

extension BookingFilterResultVC:
  ViewApplicable
{
  
}

class BookingFilterResultVC: UIViewController {
  
  var backBarButtonItem: UIBarButtonItem = {
    let barButtonItem = UIFactory.backBarButtonItem
    return barButtonItem
  }()
  var scrollView: UIScrollView = {
    let scrollView = UIFactory.scrollView
    return scrollView
  }()
  var scrollContentView: UIStackView = {
    let stackView = UIFactory.scrollViewStackView
    return stackView
  }()
  var formView: UIView = {
    let view = UIView()
    return view
  }()
  var formContentView: UIStackView = {
    let stackView = UIFactory.formStackView
    return stackView
  }()
  var fristButton: UIButton = {
    let button = UIFactory.button
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItems = [backBarButtonItem]
    view.addSubviews([scrollView])
    scrollView.addSubviews([scrollContentView])
    scrollContentView.addArrangedSubviews([formView])
    formView.addSubviews([formContentView])
    formContentView.addArrangedSubviews([fristButton])
    applyView()
  }
  
  func applyAutoLayout() {
    UIFactory.formAutoLayout(in: view,
                       scrollView: scrollView,
                       scrollContentView: scrollContentView,
                       formView: formView,
                       formContentView: formContentView, formContentInset: UIConstant.mediumSpace,
                       formButtons: [fristButton])
  }
  
  func applyProperty() {
    backBarButtonItem.addTargetForAction(self, action: #selector(buttonTouchUpInside))
    fristButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    UIFactory.formProperty(in: view,
                           scrollView: scrollView,
                           scrollContentView: scrollContentView,
                           formView: formView,
                           formContentView: formContentView,
                           formButtons: [fristButton])
  }
  
  func applyLocalize() {
    navigationItem.title = String(describing: Self.self)
  }
  
  func applyStyle() {
    UIFactory.formStyle(in: view,
                        scrollView: scrollView,
                        scrollContentView: scrollContentView,
                        formView: formView,
                        formContentView: formContentView,
                        formButtons: [fristButton])}
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    switch sender {
    case backBarButtonItem:
      dismiss(animated: true)
    case fristButton:
      let vc = BookingFormVC()
      navigationController?.pushViewController(vc, animated: true)
    default:
      break
    }
  }
  
}
