//
//  BookingFilterVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

import MaterialComponents.MaterialButtons

extension BookingFilterVC:
  ViewApplicable
{
  
}

class BookingFilterVC: UIViewController {
  
  var serviceType: String?
  
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
  var calendarButton: UIButton = {
    let button = UIFactory.button
    return button
  }()
  var guestButton: UIButton = {
    let button = UIFactory.button
    return button
  }()
  var filterButton: MDCButton = {
    let button = UIFactory.mdcButton
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItems = [backBarButtonItem]
    view.addSubviews([scrollView])
    scrollView.addSubviews([scrollContentView])
    scrollContentView.addArrangedSubviews([formView])
    formView.addSubviews([formContentView])
    formContentView.addArrangedSubviews([calendarButton, guestButton, filterButton])
    applyView()
  }
  
  func applyAutoLayout() {
    UIFactory.formAutoLayout(in: view,
                             scrollView: scrollView,
                             scrollContentView: scrollContentView,
                             formView: formView,
                             formContentView: formContentView, formContentInset: UIConstant.mediumSpace,
                             formButtons: [calendarButton, guestButton, filterButton])
  }
  
  func applyProperty() {
    backBarButtonItem.addTargetForAction(self, action: #selector(buttonTouchUpInside))
    calendarButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    guestButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    filterButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    UIFactory.formProperty(in: view,
                           scrollView: scrollView,
                           scrollContentView: scrollContentView,
                           formView: formView,
                           formContentView: formContentView,
                           formButtons: [calendarButton, guestButton, filterButton])
  }
  
  func applyLocalize() {
    navigationItem.title = String(describing: Self.self)
    filterButton.setTitle("RESULT", for: [])
  }
  
  func applyStyle() {
    UIFactory.formStyle(in: view,
                        scrollView: scrollView,
                        scrollContentView: scrollContentView,
                        formView: formView,
                        formContentView: formContentView,
                        formButtons: [calendarButton, guestButton])
    filterButton.applyContained(containerScheme)}
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    switch sender {
    case backBarButtonItem:
      dismiss(animated: true)
    case calendarButton:
      let vc = BookingFormCalendarVC()
      let nc = UINavigationController(rootViewController: vc)
      nc.modalPresentationStyle = .fullScreen
      present(nc, animated: true)
    case guestButton:
      let vc = BookingFormGuestVC()
      let nc = UINavigationController(rootViewController: vc)
      nc.modalPresentationStyle = .fullScreen
      present(nc, animated: true)
    case filterButton:
//      let vc = BookingFilterResultVC()
//      navigationController?.pushViewController(vc, animated: true)
      let vc = BookingFormVC()
      navigationController?.pushViewController(vc, animated: true)
    default:
      break
    }
  }
  
}

