//
//  ListViewCell.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialMath
import MaterialComponents.MaterialInk

protocol ListViewCellDelegate: class {
  func collectionViewCell(_ collectionViewCell: UICollectionViewCell, didAction action: String)
}

struct ListViewCellDisplayed {
  var title: String = ""
  var detail: String = ""
  var leadingImg: UIImage?
  var trailingImg: UIImage?
}

extension CollectionViewCell
{
  
}

class CollectionViewCell: UICollectionViewCell {
  
  struct Constant {
    static let lowHeight: CGFloat = 60.0
    static let mediumHeight: CGFloat = 80.0
    static let imageSide: CGFloat = 40.0
  }
  enum Action: String, CaseIterable {
    case none
  }
  
  var wrapperV: ShadowedView = {
    var v = ShadowedView()
    return v
  }()
  var rippleV: MDCRippleView = {
    var v = MDCRippleView()
    return v
  }()
  var contentStv: UIStackView = {
    var stv = UIStackView()
    stv.axis = .horizontal
    stv.alignment = .top
    stv.distribution = .fillProportionally
    stv.spacing = UIConstant.mediumSpace
    return stv
  }()
  var leadingImgv: UIImageView = {
    var imgv = UIImageView()
    imgv.contentMode = .scaleAspectFill
    return imgv
  }()
  var trailingImgv: UIImageView = {
    var imgv = UIImageView()
    imgv.contentMode = .scaleAspectFill
    return imgv
  }()
  var textStv: UIStackView = {
    var stv = UIStackView()
    stv.axis = .vertical
    stv.alignment = .fill
    stv.distribution = .fillProportionally
    stv.spacing = UIConstant.lowSpace
    return stv
  }()
  var titleLb: UILabel = {
    var lb = UILabel()
    return lb
  }()
  var detailLb: UILabel = {
    var lb = UILabel()
    return lb
  }()
  var bottomBorderV: UIView = {
    let v = UIView()
    return v
  }()
   
  weak var delegate: ListViewCellDelegate?
  var lastTouch: CGPoint?
   
  override init(frame: CGRect) {
    super.init(frame: frame)
    contentView.backgroundColor = .clear
    contentView.addSubview(wrapperV)
    wrapperV.addSubview(contentStv)
    wrapperV.addSubview(rippleV)
    contentStv.addArrangedSubviews([leadingImgv, textStv, trailingImgv])
    textStv.addArrangedSubviews([titleLb, detailLb])
    contentView.addSubview(bottomBorderV)
    contentView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    wrapperV.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    rippleV.snp.makeConstraints {
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
    leadingImgv.snp.makeConstraints {
      $0.width.equalTo(Constant.imageSide)
      $0.height.equalTo(Constant.imageSide)
    }
    trailingImgv.snp.makeConstraints {
      $0.width.equalTo(Constant.imageSide)
      $0.height.equalTo(Constant.imageSide)
    }
    bottomBorderV.snp.makeConstraints {
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
    rippleV.cancelAllRipples(animated: false, completion: nil)
    titleLb.text = nil
    detailLb.text = nil
    leadingImgv.image = nil
    trailingImgv.image = nil
    bottomBorderV.isHidden = false
    applyProperties()
    applyTheme()
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
          rippleV.beginRippleTouchDown(at: lastTouch, animated: true, completion: nil)
        } else {
          rippleV.beginRippleTouchUp(animated: true, completion: nil)
        }
      }
    }
  }
   
  func applyProperties() {
    titleLb.numberOfLines = 0
    detailLb.numberOfLines = 0
    detailLb.isHidden = true
    leadingImgv.isHidden = true
    trailingImgv.isHidden = true
  }
  
  func applyTheme() {
    //    let effectColor = colorScheme.onSurfaceColor.withAlphaComponent(MDCConstant.inkAlpha)
    //    rippleV.rippleColor = effectColor
    wrapperV.backgroundColor = colorScheme.surfaceColor
    titleLb.font = typographyScheme.subtitle1
    titleLb.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    detailLb.font = typographyScheme.body2
    detailLb.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.detailColorOpacity)
    leadingImgv.tintColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    trailingImgv.tintColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
    bottomBorderV.backgroundColor = UIConstant.borderColor
  }
  
  func populate(_ displayed: ListViewCellDisplayed) {
    titleLb.text = displayed.title
    detailLb.text = displayed.detail
    leadingImgv.image = displayed.leadingImg
    trailingImgv.image = displayed.trailingImg
    titleLb.isHidden = (titleLb.text ?? "").isEmpty
    detailLb.isHidden = (detailLb.text ?? "").isEmpty
    leadingImgv.isHidden = leadingImgv.image == nil
    trailingImgv.isHidden = trailingImgv.image == nil
  }
  
  func applyCenterStyle() {
    contentStv.alignment = .center
    textStv.alignment = .center
  }
  
  func applyCenterVerticalStyle() {
    contentStv.alignment = .center
  }
  
}

