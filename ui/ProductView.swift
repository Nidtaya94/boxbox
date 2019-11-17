//
//  ProductView.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 17/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialCards

struct ProductViewDisplayed {
  var imageURL: URL?
  var iconImage: UIImage?
  var title: String?
  var subtitle: String?
}

protocol ProductViewDelegate: class {
  func productView(didSelectItemAt index: Int)
}

extension ProductView
{
  
}

class ProductView: MDCCard {

  var imageView: UIImageView = {
    let imaegeView = UIImageView()
    return imaegeView
  }()
  
  var infomationView: UIView = {
    let view = UIView()
    return view
  }()
  
  var iconImageView: UIImageView = {
    let imaegeView = UIImageView()
    return imaegeView
  }()
  
  var labelStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fillProportionally
    stackView.spacing = UIConstant.lowSpace
    return stackView
  }()
  
  var titleLabel: UILabel = {
    var label = UILabel()
    label.setContentCompressionResistancePriority(.required, for: .vertical)
    return label
  }()
  
  var subtitleLabel: UILabel = {
    var label = UILabel()
    label.setContentCompressionResistancePriority(.required, for: .vertical)
    return label
  }()
  
  var viewButton: UIButton = {
    var button = UIButton(type: .custom)
    return button
  }()
  
  var actionButton: UIButton = {
    var button = UIButton()
    return button
  }()
  
  weak var delegate: ProductViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    layer.masksToBounds = true
    enableRippleBehavior = true
    viewButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    actionButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    addSubview(viewButton)
    addSubview(imageView)
    addSubview(infomationView)
    infomationView.addSubview(iconImageView)
    infomationView.addSubview(labelStackView)
    infomationView.addSubview(actionButton)
    labelStackView.addArrangedSubview(titleLabel)
    labelStackView.addArrangedSubview(subtitleLabel)
    imageView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    viewButton.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    infomationView.snp.makeConstraints {
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    iconImageView.snp.makeConstraints {
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
      $0.centerY.equalToSuperview()
      $0.width.equalTo(50)
      $0.height.equalTo(50)
    }
    labelStackView.snp.makeConstraints {
      $0.top.greaterThanOrEqualToSuperview().offset(UIConstant.mediumSpace)
      $0.bottom.lessThanOrEqualToSuperview().offset(-UIConstant.mediumSpace)
      $0.left.equalTo(iconImageView.snp.right).offset(UIConstant.mediumSpace)
      $0.centerY.equalToSuperview()
    }
    actionButton.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalTo(labelStackView.snp.right).offset(UIConstant.mediumSpace)
      $0.width.equalTo(100)
    }
    applyProperties()
    applyTheme()
    layoutSubviews()
    layoutIfNeeded()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    print(#function, sender)
    delegate?.productView(didSelectItemAt: 0)
  }
  
  func applyProperties() {
    titleLabel.numberOfLines = 1
    subtitleLabel.numberOfLines = 1
  }
  
  func applyTheme() {
    backgroundColor = colorScheme.surfaceColor
//    setShadowElevation(ShadowElevation(rawValue: 2), for: .normal)
//    setShadowElevation(ShadowElevation(rawValue: 4), for: .highlighted)
    titleLabel.font = typographyScheme.subtitle1
    titleLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    subtitleLabel.font = typographyScheme.subtitle1
    subtitleLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.detailColorOpacity)
  }
  
  func populate(_ displayed: ProductViewDisplayed) {
//    imageView.image = displayed.imageURL
    iconImageView.image = displayed.iconImage
    titleLabel.text = displayed.title
    subtitleLabel.text = displayed.subtitle
    subtitleLabel.isHidden = subtitleLabel.text?.isEmpty ?? true
  }
  
}
