//
//  ListViewCell.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialInk

protocol ListViewCellDelegate: class {
  func listViewCell(_ collectionViewCell: UICollectionViewCell, didAction action: String)
}

struct ListViewCellModel {
  var title: String = ""
  var detail: String = ""
  var leadingImg: UIImage?
  var trailingImg: UIImage?
}

extension ListViewCell:
  ViewApplicable
{
  
}

class ListViewCell: UICollectionViewCell {
  
  struct Constant {
    static let lowHeight: CGFloat = 60.0
    static let mediumHeight: CGFloat = 80.0
    static let imageSide: CGFloat = 40.0
  }
  
  enum Action: String, CaseIterable {
    case none
  }
  
  var lastTouch: CGPoint?
  
  var wrapperView: UIView = UIView()
  var contentStv: UIStackView = {
    var stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .top
    stackView.distribution = .fillProportionally
    stackView.spacing = UIConstant.mediumSpace
    return stackView
  }()
  var leadingImageView: UIImageView = {
    var imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  var trailingImageView: UIImageView = {
    var imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    return imageView
  }()
  var textStv: UIStackView = {
    var stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fillProportionally
    stackView.spacing = UIConstant.lowSpace
    return stackView
  }()
  var titleLabel: UILabel = UILabel()
  var subtitleLabel: UILabel = UILabel()
  var bottomBorderView: UIView = UIView()
  var rippleView: MDCRippleView = {
    var view = MDCRippleView()
    return view
  }()
   
  weak var delegate: ListViewCellDelegate?
   
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.addSubviews([wrapperView])
    wrapperView.addSubviews([contentStv])
    contentStv.addArrangedSubviews([leadingImageView, textStv, trailingImageView])
    textStv.addArrangedSubviews([titleLabel, subtitleLabel])
    contentView.addSubviews([bottomBorderView])
    wrapperView.addSubviews([rippleView])
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
    titleLabel.text = nil
    subtitleLabel.text = nil
    leadingImageView.image = nil
    trailingImageView.image = nil
    bottomBorderView.isHidden = false
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
      if let lastTouch = lastTouch {
        if isHighlighted {
          rippleView.beginRippleTouchDown(at: lastTouch, animated: true, completion: nil)
        } else {
          rippleView.beginRippleTouchUp(animated: true, completion: nil)
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
    wrapperView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    contentStv.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UIConstant.lowSpace)
      $0.right.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.bottom.equalToSuperview().offset(-UIConstant.lowSpace)
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
    }
    leadingImageView.snp.makeConstraints {
      $0.width.equalTo(Constant.imageSide)
      $0.height.equalTo(Constant.imageSide)
    }
    trailingImageView.snp.makeConstraints {
      $0.width.equalTo(Constant.imageSide)
      $0.height.equalTo(Constant.imageSide)
    }
    bottomBorderView.snp.makeConstraints {
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(UIConstant.borderHeight)
    }
    rippleView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
  }
   
  func applyProperty() {
    wrapperView.clipsToBounds = true
    titleLabel.numberOfLines = 0
    subtitleLabel.numberOfLines = 0
    leadingImageView.isHidden = true
    trailingImageView.isHidden = true
  }
  
  func applyLocalize() {
    
  }
  
  func applyStyle() {
    contentView.backgroundColor = .clear
    wrapperView.backgroundColor = colorScheme.surfaceColor
    titleLabel.font = typographyScheme.subtitle1
    titleLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    subtitleLabel.font = typographyScheme.body2
    subtitleLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.detailColorOpacity)
    leadingImageView.tintColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    trailingImageView.tintColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    bottomBorderView.backgroundColor = UIConstant.borderColor
  }
  
  func applyModel(_ model: ListViewCellModel) {
    titleLabel.text = model.title
    subtitleLabel.text = model.detail
    leadingImageView.image = model.leadingImg
    trailingImageView.image = model.trailingImg
    titleLabel.isHidden = (titleLabel.text ?? "").isEmpty
    subtitleLabel.isHidden = (subtitleLabel.text ?? "").isEmpty
    leadingImageView.isHidden = leadingImageView.image == nil
    trailingImageView.isHidden = trailingImageView.image == nil
  }
  
  func applyCenterStyle() {
    contentStv.alignment = .center
    textStv.alignment = .center
  }
  
  func applyCenterVerticalStyle() {
    contentStv.alignment = .center
  }
  
}

