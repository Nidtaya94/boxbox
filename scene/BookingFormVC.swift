//
//  BookingFormVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

extension BookingFormVC:
  ViewApplicable
{
  
}

class BookingFormVC: UIViewController {
  
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
  var cardView: CardView = {
    let view = CardView()
    return view
  }()
  var calendarButton: UIButton = {
    let button = UIFactory.button
    return button
  }()
  var guestButton: UIButton = {
    let button = UIFactory.button
    return button
  }()
  var filterButton: UIButton = {
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
    formContentView.addArrangedSubviews([cardView, calendarButton, guestButton, filterButton])
    applyView()
    fetchData()
  }
  
  func applyAutoLayout() {
    UIFactory.formAutoLayout(in: view,
                             scrollView: scrollView,
                             scrollContentView: scrollContentView,
                             formView: formView,
                             formContentView: formContentView, formContentInset: .zero,
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
    formContentView.distribution = .fill
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
                        formButtons: [calendarButton, guestButton, filterButton])
    cardView.backgroundColor = .gray
    cardView.shadowView.backgroundColor = .lightGray}
  
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
      let vc = BookingFilterResultVC()
      navigationController?.pushViewController(vc, animated: true)
    default:
      break
    }
  }
  
}

extension BookingFormVC {
  
  func fetchData() {
    var d = CardViewModel()
    d.key = """
      KEY
      KEY
      KEY
    """
    d.value = """
      VALUE
      VALUE
      VALUE
    """
    cardView.applyModel(d)
  }
  
}

