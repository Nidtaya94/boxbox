//
//  ListReusableView.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialMath
import MaterialComponents.MaterialInk

protocol ListReusableViewDelegate: class {
  func collectionReusableView(_ collectionReusableView: UICollectionReusableView, didAction action: String)
}

struct ListReusableViewDisplayed {
  var title: String = ""
  var detail: String = ""
  var trailingButtonTitle: String? = ""
  var trailingButtonImg: UIImage? = nil
}

extension CollectionReusableView
{
  
}

class CollectionReusableView: UICollectionReusableView {
  
  struct Constant {
    static let lowHeight: CGFloat = 30
    static let mediunHeight: CGFloat = 45
    static let highHeight: CGFloat = 60
    static let imageSide: CGFloat = 40.0
  }
  enum Action: String, CaseIterable {
    case trailingButton
  }
  
  var contentStackView: UIStackView = {
    var StackView = UIStackView()
    StackView.axis = .horizontal
    StackView.alignment = .fill
    StackView.distribution = .fill
    StackView.spacing = UIConstant.mediumSpace
    return StackView
  }()
  var trailingButton: UIButton = {
    let Button = UIButton(type: .custom)
    return Button
  }()
  var textStackView: UIStackView = {
    var stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fillProportionally
    stackView.spacing = UIConstant.mediumSpace
    return stackView
  }()
  var titleLabel: UILabel = {
    var label = UILabel()
    
    return label
  }()
  var detailLabel: UILabel = {
    var label = UILabel()
    return label
  }()
  var topBorderView: UIView = {
    let view = UIView()
    view.isHidden = true
    return view
  }()
  var bottomBorderView: UIView = {
    let view = UIView()
    view.isHidden = true
    return view
  }()
  
  weak var delegate: ListReusableViewDelegate?

  override init(frame: CGRect) {
    super.init(frame: frame)
    trailingButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    addSubview(contentStackView)
    contentStackView.addArrangedSubviews([textStackView, trailingButton])
    textStackView.addArrangedSubviews([titleLabel, detailLabel])
    addSubview(topBorderView)
    addSubview(bottomBorderView)
    
    contentStackView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UIConstant.lowSpace)
      $0.right.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.bottom.equalToSuperview().offset(-UIConstant.lowSpace)
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
    }
    
    topBorderView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    bottomBorderView.snp.makeConstraints {
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    applyProperties()
    applyTheme()
    setNeedsLayout()
    layoutIfNeeded()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    titleLabel.text = nil
    trailingButton.setTitle(nil, for: .normal)
//    topBorderV.isHidden = true
//    bottomBorderV.isHidden = true
    applyProperties()
    applyTheme()
    setNeedsLayout()
    layoutIfNeeded()
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    delegate?.collectionReusableView(self, didAction: Action.trailingButton.rawValue)
  }
  
  func applyProperties() {
    titleLabel.numberOfLines = 0
    detailLabel.numberOfLines = 0
    detailLabel.isHidden = true
    trailingButton.isHidden = true
  }
  
  func applyTheme() {
    backgroundColor = colorScheme.surfaceColor
    titleLabel.font = typographyScheme.body2
    titleLabel.textColor = colorScheme.onSurfaceColor
    detailLabel.font = typographyScheme.body2
    detailLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.detailColorOpacity)
    trailingButton.titleLabel?.font = typographyScheme.button
    trailingButton.setTitleColor(colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity), for: .normal)
    trailingButton.imageView?.tintColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    topBorderView.backgroundColor = UIConstant.borderColor
    bottomBorderView.backgroundColor = UIConstant.borderColor
  }
  
  func populate(_ displayed: ListReusableViewDisplayed) {
    titleLabel.text = displayed.title
    detailLabel.text = displayed.detail
    trailingButton.setTitle(displayed.trailingButtonTitle, for: .normal)
    trailingButton.setImage(displayed.trailingButtonImg, for: .normal)
    titleLabel.isHidden = (titleLabel.text ?? "").isEmpty
    detailLabel.isHidden = (detailLabel.text ?? "").isEmpty
    trailingButton.isHidden = (trailingButton.title(for: .normal) ?? "").isEmpty && trailingButton.image(for: .normal) == nil
  }
  
//  func applyBottomStyle() {
//    trailingButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0.1, right: 0)
//    trailingButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0.1, right: 0)
//    trailingButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0.1, right: 0)
//    trailingButton.contentVerticalAlignment = .bottom
//    trailingButton.setContentHuggingPriority(.required, for: .horizontal)
//    textStackView.axis = .horizontal
//    textStackView.alignment = .bottom
//    textStackView.distribution = .equalSpacing
//    titleLabel.textAlignment = .left
//    titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
//    detailLabel.textAlignment = .right
//    detailLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
//  }
  
}
