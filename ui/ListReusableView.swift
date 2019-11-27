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
  func listReusableView(_ collectionReusableView: UICollectionReusableView, didAction action: String)
}

struct ListReusableViewModel {
  var title: String = ""
  var detail: String = ""
  var trailingButtonTitle: String? = ""
  var trailingButtonImg: UIImage? = nil
}

extension ListReusableView:
  ViewApplicable
{
  
}

class ListReusableView: UICollectionReusableView {
  
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
    var stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = UIConstant.mediumSpace
    return stackView
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
  var subtitleLabel: UILabel = {
    var label = UILabel()
    return label
  }()
  var topBorderView: UIView = {
    let view = UIView()
    return view
  }()
  var bottomBorderView: UIView = {
    let view = UIView()
    return view
  }()
  
  weak var delegate: ListReusableViewDelegate?

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubviews([contentStackView])
    contentStackView.addArrangedSubviews([textStackView, trailingButton])
    textStackView.addArrangedSubviews([titleLabel, subtitleLabel])
    addSubviews([topBorderView])
    addSubviews([bottomBorderView])
    applyView()
    setNeedsLayout()
    layoutIfNeeded()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    applyView()
    setNeedsLayout()
    layoutIfNeeded()
  }
  
  func applyAutoLayout() {
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
      $0.height.equalTo(UIConstant.borderHeight)
    }
    bottomBorderView.snp.makeConstraints {
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(UIConstant.borderHeight)
    }
  }
  
  func applyProperty() {
    trailingButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    titleLabel.numberOfLines = 0
    subtitleLabel.numberOfLines = 0
    subtitleLabel.isHidden = true
    trailingButton.isHidden = true
    topBorderView.isHidden = true
    bottomBorderView.isHidden = true
  }
  
  func applyLocalize() {
    
  }
  
  func applyStyle() {
    backgroundColor = colorScheme.surfaceColor
    titleLabel.font = typographyScheme.body2
    titleLabel.textColor = colorScheme.onSurfaceColor
    subtitleLabel.font = typographyScheme.body2
    subtitleLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.detailColorOpacity)
    trailingButton.titleLabel?.font = typographyScheme.button
    trailingButton.setTitleColor(colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity), for: .normal)
    trailingButton.imageView?.tintColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    topBorderView.backgroundColor = UIConstant.borderColor
    bottomBorderView.backgroundColor = UIConstant.borderColor
  }
  
  func applyModel(_ model: ListReusableViewModel) {
    titleLabel.text = model.title
    subtitleLabel.text = model.detail
    trailingButton.setTitle(model.trailingButtonTitle, for: .normal)
    trailingButton.setImage(model.trailingButtonImg, for: .normal)
    titleLabel.isHidden = (titleLabel.text ?? "").isEmpty
    subtitleLabel.isHidden = (subtitleLabel.text ?? "").isEmpty
    trailingButton.isHidden = (trailingButton.title(for: .normal) ?? "").isEmpty && trailingButton.image(for: .normal) == nil
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    delegate?.listReusableView(self, didAction: Action.trailingButton.rawValue)
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
