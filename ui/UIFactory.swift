//
//  UIFactory.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialIcons

struct UIFactory {
  
  static var backBarButtonItem: UIBarButtonItem {
    let image = MDCIcons.imageFor_ic_arrow_back()?.withRenderingMode(.alwaysTemplate)
    let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: nil, action: nil)
    return barButtonItem
  }
  
  
  
  static var dummyLabel: UILabel {
    let label = UILabel()
    label.textAlignment = .center
    return label
  }
  
  static var button: UIButton {
    let button = UIButton(type: .custom)
    return button
  }
  
  static var mdcButton: MDCButton {
    let button = MDCButton(type: .custom)
    return button
  }
  
  static var cornerButton: UIButton {
    let button = UIButton(type: .custom)
    return button
  }
  
  static var dynamicLabel: UILabel {
    let label = UILabel()
    label.setContentCompressionResistancePriority(.required, for: .vertical)
    label.setContentHuggingPriority(.required, for: .vertical)
    return label
  }
  
  static var cardView: UIView {
    let view = UIView()
    view.layer.cornerRadius = UIConstant.mediumCornerRadius
    view.clipsToBounds = true
    return view
  }
  
  static var imageView: UIImageView {
    let imaegeView = UIImageView()
    return imaegeView
  }
  
  static var cardShadowView: ShadowedView {
    let view = ShadowedView()
    view.layer.cornerRadius = UIConstant.mediumCornerRadius
    return view
  }
  
  static var cardRippleView: MDCRippleView {
    let view = MDCRippleView()
    view.layer.cornerRadius = UIConstant.mediumCornerRadius
    view.layer.masksToBounds = true
    return view
  }
  
}

extension UIFactory {
 
  
  
}

extension UIFactory {
  
  static var placeHolderImage: UIImage {
    return UIImage(color: .lightGray, size: .min)
  }
  
}

extension UIFactory {
  
  static var collectionView: UICollectionView {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.contentInsetAdjustmentBehavior = .always
    collectionView.setupScrollVertical()
    return collectionView
  }
  
  static var collectionViewLayout: UICollectionViewFlowLayout {
    let layout = UICollectionViewFlowLayout()
    layout.sectionHeadersPinToVisibleBounds = true
    layout.sectionFootersPinToVisibleBounds = true
    return layout
  }
  
  static var scrollView: UIScrollView {
    let scrollView = UIScrollView()
    scrollView.contentInsetAdjustmentBehavior = .always
    scrollView.setupScrollVertical()
    return scrollView
  }
  
  static var scrollViewStackView: UIStackView {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = .zero
    return stackView
  }
  
}

extension UIFactory {
  
  static var formStackView: UIStackView {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = UIConstant.lowSpace
    return stackView
  }
  
  static func formAutoLayout(in view: UIView,
                             scrollView: UIScrollView,
                             scrollContentView: UIStackView,
                             formView: UIView,
                             formContentView: UIStackView,
                             formContentInset: CGFloat,
                             formButtons: [UIButton]) {
    scrollView.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
    scrollContentView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalTo(view.snp.right)
      $0.bottom.equalToSuperview()
      $0.left.equalTo(view.snp.left)
    }
    formContentView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(formContentInset)
      $0.right.equalToSuperview().offset(-formContentInset)
      $0.bottom.equalToSuperview().offset(-formContentInset)
      $0.left.equalToSuperview().offset(formContentInset)
    }
    for i in formButtons {
      i.snp.makeConstraints {
        $0.height.equalTo(UIConstant.buttonHeight)
      }
    }
  }
  
  static func formProperty(in view: UIView,
                           scrollView: UIScrollView,
                           scrollContentView: UIStackView,
                           formView: UIView,
                           formContentView: UIStackView,
                           formButtons: [UIButton]) {
    scrollContentView.spacing = UIConstant.lowSpace
  }
  
  static func formStyle(in view: UIView,
                        scrollView: UIScrollView,
                        scrollContentView: UIStackView,
                        formView: UIView,
                        formContentView: UIStackView,
                        formButtons: [UIButton]) {
    view.backgroundColor = MDCTheme.theme.colorScheme.backgroundColor
    formView.backgroundColor = .gray
    formContentView.backgroundColor = .lightGray
    for i in formButtons {
      i.setBackgroundImage(UIImage(color: .black, size: .min), for: [])
    }
  }
  
}

