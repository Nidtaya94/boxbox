//
//  CardView.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialCards

struct CardViewModel {
  var key: String?
  var value: String?
}

extension CardView:
  ViewApplicable,
  UIGestureRecognizerDelegate,
  MDCRippleViewDelegate
{
  
}

class CardView: UIView {
  
  struct Constant {
    
  }
  
  enum Action: String, CaseIterable {
    case none
  }
  
  var lastTouch: CGPoint?
  
  var tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
  var shadowView: ShadowedView = {
    var view = UIFactory.cardShadowView
    return view
  }()
  var contentStackView: UIStackView = {
    var stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fillProportionally
    stackView.spacing = UIConstant.lowSpace
    return stackView
  }()
  var titleLabel: UILabel = {
    let label = UIFactory.dynamicLabel
    return label
  }()
  var detailLabel: UILabel = {
    let label = UIFactory.dynamicLabel
    return label
  }()
  var noneButton: MDCButton = {
    let button = UIFactory.mdcButton
    return button
  }()
  var rippleView: MDCRippleView = {
    var view = UIFactory.cardRippleView
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    shadowView.addGestureRecognizers([tapGesture])
    addSubviews([shadowView])
    shadowView.addSubviews([contentStackView])
    contentStackView.addArrangedSubviews([titleLabel, detailLabel, noneButton])
    shadowView.addSubviews([rippleView])
    applyView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let location = touches.first?.location(in: self) {
      self.lastTouch = location;
    }
    super.touchesBegan(touches, with: event)
    shadowView.setDefaultElevation()
  }
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesMoved(touches, with: event)
    shadowView.setHilightElevation()
  }
  
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesEnded(touches, with: event)
    shadowView.setDefaultElevation()
  }
  
  override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesCancelled(touches, with: event)
    shadowView.setDefaultElevation()
  }
  
  func applyAutoLayout() {
    shadowView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UIConstant.mediumSpace)
      $0.right.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.bottom.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
    }
    contentStackView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UIConstant.mediumSpace)
      $0.right.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.bottom.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
    }
    titleLabel.snp.makeConstraints {
      $0.height.greaterThanOrEqualTo(23)
    }
    detailLabel.snp.makeConstraints {
      $0.height.greaterThanOrEqualTo(23)
    }
    noneButton.snp.makeConstraints {
      $0.height.equalTo(50)
    }
    rippleView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
  }
  
  func applyProperty() {
    tapGesture.addTarget(self, action: #selector(tapGestureRecognized))
    noneButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    tapGesture.cancelsTouchesInView = false
    tapGesture.delegate = self
    contentStackView.distribution = .fillProportionally
    titleLabel.numberOfLines = 0
    detailLabel.numberOfLines = 0
  }
  
  func applyLocalize() {
    
  }
  
  func applyStyle() {
    backgroundColor = .clear
    backgroundColor = colorScheme.surfaceColor
    shadowView.setDefaultElevation()
    titleLabel.font = typographyScheme.subtitle2
    titleLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.detailColorOpacity)
    detailLabel.font = typographyScheme.subtitle1
    detailLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    noneButton.applyContained(containerScheme)
    isUserInteractionEnabled = true
  }
  
  func applyModel(_ model: CardViewModel) {
    titleLabel.text = model.key
    detailLabel.text = model.value
    setNeedsLayout()
    layoutIfNeeded()
  }
  
  @objc func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
    print(#function)
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    print(#function)
  }
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    let isControllTapped = touch.view is UIControl
    return !isControllTapped
  }
  
}

