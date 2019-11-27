//
//  ProductView.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 17/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

protocol GuestDetailViewDelegate: class {
  func guestDetailView(_ view: UIView, tag: Int)
}

struct GuestDetailViewModel {
  var title: String = ""
  var detail: String = ""
}

extension GuestDetailView:
  ViewApplicable
{
  
}

class GuestDetailView: UIView {
  
  struct Constant {
    
  }
  
  enum Action: String, CaseIterable {
    case none
  }
  
  var contentStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.distribution = .fillProportionally
    stackView.spacing = UIConstant.lowSpace
    return stackView
  }()
  var countLabel: UILabel = {
    var label = UILabel()
    return label
  }()
  var informationStackView: UIStackView = {
    var stackView = UIStackView()
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
    let label = UIFactory.dynamicLabel
    return label
  }()
  var buttonStackView: UIStackView = {
    var stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.distribution = .fillProportionally
    stackView.spacing = UIConstant.lowSpace
    return stackView
  }()
  var minusButton: UIButton = {
    var button = UIFactory.button
    return button
  }()
  var plusButton: UIButton = {
    var button = UIFactory.button
    return button
  }()
  var bottomBorderView: UIView = {
    let view = UIView()
    return view
  }()
  
  weak var delegate: GuestDetailViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviews([contentStackView])
    contentStackView.addArrangedSubviews([countLabel, informationStackView, buttonStackView])
    informationStackView.addArrangedSubviews([titleLabel, subtitleLabel])
    buttonStackView.addArrangedSubviews([minusButton, plusButton])
    addSubviews([bottomBorderView])
    applyView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func applyAutoLayout() {
    contentStackView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UIConstant.mediumSpace)
      $0.right.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.bottom.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
    }
    countLabel.snp.makeConstraints {
      $0.width.greaterThanOrEqualTo(50)
    }
    titleLabel.snp.makeConstraints {
      $0.height.greaterThanOrEqualTo(50)
    }
    subtitleLabel.snp.makeConstraints {
      $0.height.greaterThanOrEqualTo(23)
    }
    minusButton.snp.makeConstraints {
      $0.height.equalTo(44)
      $0.width.equalTo(44)
    }
    plusButton.snp.makeConstraints {
      $0.height.equalTo(44)
      $0.width.equalTo(44)
    }
    bottomBorderView.snp.makeConstraints {
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
      $0.height.equalTo(UIConstant.borderHeight)
    }
  }
  
  func applyProperty() {
//    noneButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
  }
  
  func applyLocalize() {
    
  }
  
  func applyStyle() {
    backgroundColor = .clear
    backgroundColor = colorScheme.surfaceColor
//    shadowView.setDefaultElevation()
//    titleLabel.font = typographyScheme.subtitle2
//    titleLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.detailColorOpacity)
//    detailLabel.font = typographyScheme.subtitle1
//    detailLabel.textColor = colorScheme.onSurfaceColor.withAlphaComponent(UIConstant.titleColorOpacity)
//    noneButton.applyContained(containerScheme)
    isUserInteractionEnabled = true
    bottomBorderView.backgroundColor = UIConstant.borderColor
  }
  
  func applyModel(_ model: CardViewModel) {
//    titleLabel.text = model.key
//    detailLabel.text = model.value
    setNeedsLayout()
    layoutIfNeeded()
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    print(#function)
  }
  
}
