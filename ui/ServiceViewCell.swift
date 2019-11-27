//
//  ServiceViewCell.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialInk

protocol ServiceViewCellDelegate: class {
  func serviceViewCell(_ collectionViewCell: UICollectionViewCell, didAction action: String)
}

struct ServiceViewCellModel {
  var imageURL: URL?
  var iconImage: UIImage?
  var title: String?
  var subtitle: String?
}

extension ServiceViewCell:
  ViewApplicable
{
  
}

class ServiceViewCell: UICollectionViewCell {
  
  struct Constant {
    
  }

  enum Action: String, CaseIterable {
    case book
  }
  
  var lastTouch: CGPoint?
  
  var shadowView: ShadowedView = {
    var view = UIFactory.cardShadowView
    return view
  }()
  var containerView: UIView = {
    let view = UIFactory.cardView
    return view
  }()
  var imageView: UIImageView = {
    let imaegeView = UIFactory.imageView
    return imaegeView
  }()
  var infomationView: UIView = {
    let view = UIView()
    return view
  }()
  var iconImageView: UIImageView = {
    let imaegeView = UIFactory.imageView
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
    var label = UIFactory.dynamicLabel
    return label
  }()
  var subtitleLabel: UILabel = {
    var label = UIFactory.dynamicLabel
    return label
  }()
  var bookButton: UIButton = {
    var button = UIFactory.cornerButton
    return button
  }()
  var rippleView: MDCRippleView = {
    var view = UIFactory.cardRippleView
    return view
  }()
  
  weak var delegate: ServiceViewCellDelegate?
   
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubviews([shadowView])
    shadowView.addSubviews([containerView])
    containerView.addSubviews([imageView, infomationView])
    infomationView.addSubviews([iconImageView, labelStackView, bookButton])
    labelStackView.addArrangedSubviews([titleLabel, subtitleLabel])
    shadowView.addSubviews([rippleView])
    applyView()
    setNeedsLayout()
    layoutIfNeeded()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
   
  override func prepareForReuse() {
    super.prepareForReuse()
    rippleView.cancelAllRipples(animated: false, completion: nil)
    applyView()
    setNeedsLayout()
    layoutIfNeeded()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    if let location = touches.first?.location(in: self) {
      self.lastTouch = location;
    }
    super.touchesBegan(touches, with: event)
  }
  
  override var isHighlighted: Bool {
    didSet {
      if let _ = lastTouch {
        if isHighlighted {
          shadowView.setHilightElevation()
//          rippleView.beginRippleTouchDown(at: lastTouch, animated: true, completion: nil)
        } else {
          shadowView.setDefaultElevation()
//          rippleView.beginRippleTouchUp(animated: true, completion: nil)
        }
      }
    }
  }
  
  func applyAutoLayout() {
    contentView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    shadowView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UIConstant.lowSpace)
      $0.right.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.bottom.equalToSuperview().offset(-UIConstant.lowSpace)
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
      $0.centerY.equalToSuperview()
    }
    containerView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    imageView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    infomationView.snp.makeConstraints {
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.lessThanOrEqualToSuperview().multipliedBy(0.35)
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
    bookButton.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalTo(labelStackView.snp.right).offset(UIConstant.mediumSpace)
      $0.width.equalTo(100)
    }
    rippleView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
  }
   
  func applyProperty() {
    bookButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    titleLabel.numberOfLines = 0
    subtitleLabel.numberOfLines = 0
  }
  
  func applyLocalize() {
    
  }
  
  func applyStyle() {
    contentView.backgroundColor = .clear
    shadowView.setDefaultElevation()
    shadowView.backgroundColor = colorScheme.surfaceColor
    containerView.backgroundColor = colorScheme.surfaceColor
    bookButton.setBackgroundImage(UIImage(color: .gray, size: .min), for: [])
    titleLabel.font = typographyScheme.subtitle1
    titleLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    subtitleLabel.font = typographyScheme.subtitle1
    subtitleLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.detailColorOpacity)
  }
  
  func applyModel(_ model: ServiceViewCellModel) {
//    imageView.image = model.imageURL
//    iconImageView.image = model.iconImage
    bookButton.setTitle("BOOK", for: [])
    titleLabel.text = model.title
    subtitleLabel.text = model.subtitle
    subtitleLabel.isHidden = subtitleLabel.text?.isEmpty ?? true
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    delegate?.serviceViewCell(self, didAction: ServiceViewCell.Action.book.rawValue)
  }
  
}
