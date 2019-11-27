//
//  ServiceDetailVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 17/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

import MaterialComponents.MaterialButtons

struct ServiceDetailVCModel {
  var detailTitle: String?
  var detail: NSAttributedString?
  var serviceTitle: String?
  var service: NSAttributedString?
}

extension ServiceDetailVC:
  ViewApplicable,
  MDCAlertDelegate
{
  
}

class ServiceDetailVC: UIViewController {
  
  var serviceType: String?
  var serviceVCModel = ServiceDetailVCModel()
  var serviceDetailResponseData = ServiceDetailResponse()
  
  let serviceDetailScrollView: UIScrollView = {
    let scrollView = UIFactory.scrollView
    return scrollView
  }()
  let serviceDetailStackView: UIStackView = {
    let stackView = UIFactory.scrollViewStackView
    return stackView
  }()
  var imageView: UIImageView = {
    let imageView = UIFactory.imageView
    return imageView
  }()
  var informationView: UIView = {
     let view = UIView()
     return view
   }()
  var informationContainerView: UIView = {
    let view = UIView()
    return view
  }()
  var detailTitleLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  var detailLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  var serviceTitleLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  var serviceLabel: UILabel = {
    let label = UILabel()
    return label
  }()
  var bookButton: MDCButton = {
    let button = UIFactory.mdcButton
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubviews([serviceDetailScrollView])
    serviceDetailScrollView.addSubviews([serviceDetailStackView])
    serviceDetailStackView.addArrangedSubviews([imageView, informationView])
    informationView.addSubviews([informationContainerView])
    informationContainerView.addSubviews([detailTitleLabel, detailLabel, serviceTitleLabel, serviceLabel])
    view.addSubviews([bookButton])
    applyView()
    fetchServiceDetail()
  }
  
  func applyAutoLayout() {
    serviceDetailScrollView.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
    serviceDetailStackView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalTo(view.snp.right)
      $0.bottom.equalToSuperview()
      $0.left.equalTo(view.snp.left)
    }
    imageView.snp.makeConstraints {
      $0.height.equalTo(imageView.snp.width).multipliedBy(1)
    }
    informationContainerView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(UIConstant.lowSpace)
      $0.right.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.bottom.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
    }
    detailTitleLabel.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
    }
    detailLabel.snp.makeConstraints {
      $0.top.equalTo(detailTitleLabel.snp.bottom).offset(UIConstant.lowestSpace)
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
    }
    serviceTitleLabel.snp.makeConstraints {
      $0.top.equalTo(detailLabel.snp.bottom).offset(UIConstant.lowSpace)
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
    }
    serviceLabel.snp.makeConstraints {
      $0.top.equalTo(serviceTitleLabel.snp.bottom).offset(UIConstant.lowestSpace)
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.left.equalToSuperview()
    }
    bookButton.snp.makeConstraints {
      $0.right.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.bottom.equalTo(view.snp.bottomMargin).offset(-UIConstant.lowSpace)
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
      $0.height.equalTo(UIConstant.buttonHeight)
    }
  }
  
  func applyProperty() {
    bookButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    serviceDetailScrollView.contentInset = UIEdgeInsets(top: 0,
                                           left: 0,
                                           bottom: (UIConstant.lowSpace * 2) + UIConstant.buttonHeight,
                                           right: 0)
    detailTitleLabel.numberOfLines = 1
    detailLabel.numberOfLines = 0
    serviceTitleLabel.numberOfLines = 1
    serviceLabel.numberOfLines = 0
  }
  
  func applyLocalize() {
    navigationItem.title = String(describing: Self.self)
    setMDCBackBarButtonItemImage()
    bookButton.setTitle("BOOK", for: [])
  }
  
  func applyStyle() {
    view.backgroundColor = colorScheme.backgroundColor
    imageView.image = UIImage(color: .gray, size: .min)
    detailTitleLabel.font = typographyScheme.subtitle1
    detailTitleLabel.textColor = colorScheme.onSurfaceColor
    detailLabel.font = typographyScheme.body2
    detailLabel.textColor = colorScheme.onSurfaceColor
    serviceTitleLabel.font = typographyScheme.subtitle1
    serviceTitleLabel.textColor = colorScheme.onSurfaceColor
    serviceLabel.font = typographyScheme.body2
    serviceLabel.textColor = colorScheme.onSurfaceColor
    bookButton.applyContained(containerScheme)
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    let vc = BookingFilterVC()
    let nc = UINavigationController(rootViewController: vc)
    nc.modalPresentationStyle = .fullScreen
    present(nc, animated: true)
  }
  
  func displayServiceDetail() {
    detailTitleLabel.text = serviceVCModel.detailTitle
    detailLabel.attributedText = serviceVCModel.detail
    serviceTitleLabel.text = serviceVCModel.serviceTitle
    serviceLabel.attributedText = serviceVCModel.service
  }
  
}

extension ServiceDetailVC {
  
  func fetchServiceDetail() {
    guard let serviceType = serviceType else {
      displayErrorMDCAlert(AppError.input("service type is null"))
      return
    }
    serviceDetailResponseData = ServiceDetailResponse()
    switch serviceType {
    case "hotel":
      let detail = serviceDetailResponseData.data?.hotelDetail
      serviceVCModel.detailTitle = detail?.detailTitle
      serviceVCModel.detail = detail?.detail?.lineSpaced(UIConstant.labelLineSpacing)
      serviceVCModel.serviceTitle = detail?.serviceTitle
      serviceVCModel.service = detail?.service?.lineSpaced(UIConstant.labelLineSpacing)
    case "beauty":
      let detail = serviceDetailResponseData.data?.beautyDetail
      serviceVCModel.detailTitle = detail?.detailTitle
      serviceVCModel.detail = detail?.detail?.lineSpaced(UIConstant.labelLineSpacing)
      serviceVCModel.serviceTitle = detail?.serviceTitle
      serviceVCModel.service = detail?.service?.lineSpaced(UIConstant.labelLineSpacing)
    default:
      displayErrorMDCAlert(AppError.notHandled("service type \(serviceType)"))
      return
    }
    displayServiceDetail()
  }
  
}
