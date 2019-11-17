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

extension ServiceDetailVC
{
  
}

class ServiceDetailVC: UIViewController {
  
  let serviceDetailScrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.contentInsetAdjustmentBehavior = .always
    scrollView.setupScrollDefault()
    scrollView.setupScrollVertical()
    scrollView.contentInset = UIEdgeInsets(top: UIConstant.mediumSpace,
                                           left: 0,
                                           bottom: (UIConstant.lowSpace * 2) + UIConstant.buttonHeight,
                                           right: 0)
    return scrollView
  }()
  
  let serviceDetailStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.distribution = .fill
    stackView.spacing = .zero
    return stackView
  }()

  var imageView: UIImageView = {
    let imaegeView = UIImageView()
    return imaegeView
  }()
  
  var infomationView: UIView = {
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
  
  var bookButton: UIButton = {
    let button = UIButton(type: .custom)
    return button
  }()
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bookButton.addTarget(self, action: #selector(buttonTouchUpInside), for: .touchUpInside)
    view.addSubview(serviceDetailScrollView)
    serviceDetailScrollView.addSubview(serviceDetailStackView)
    serviceDetailStackView.addArrangedSubview(imageView)
    serviceDetailStackView.addArrangedSubview(infomationView)
    infomationView.addSubview(detailTitleLabel)
    infomationView.addSubview(detailLabel)
    infomationView.addSubview(serviceTitleLabel)
    infomationView.addSubview(serviceLabel)
    view.addSubview(bookButton)
    serviceDetailScrollView.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
    serviceDetailStackView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.left.equalTo(view.snp.leftMargin)
      $0.bottom.equalToSuperview()
      $0.right.equalTo(view.snp.rightMargin)
    }
    imageView.snp.makeConstraints {
      $0.height.equalTo(imageView.snp.width).multipliedBy(2)
    }
    detailTitleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(5)
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
    }
    detailLabel.snp.makeConstraints {
      $0.top.equalTo(detailTitleLabel.snp.bottom).offset(5)
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
    }
    serviceTitleLabel.snp.makeConstraints {
      $0.top.equalTo(detailLabel.snp.bottom).offset(5)
      $0.right.equalToSuperview()
      $0.left.equalToSuperview()
    }
    serviceLabel.snp.makeConstraints {
      $0.top.equalTo(serviceTitleLabel.snp.bottom).offset(5)
      $0.right.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-5)
      $0.left.equalToSuperview()
    }
    bookButton.snp.makeConstraints {
      $0.right.equalToSuperview().offset(-UIConstant.mediumSpace)
      $0.bottom.equalTo(view.snp.bottomMargin).offset(-UIConstant.lowSpace)
      $0.left.equalToSuperview().offset(UIConstant.mediumSpace)
      $0.height.equalTo(UIConstant.buttonHeight)
    }
    applyProperties()
    applyTheme()
    detailTitleLabel.text = "รายละเอียด"
    detailLabel.text = """
    - บรรยากาศห้อมล้อมด้วยธรรมชาติ
    - ห้องแอร์ส่วนตัว
    - ห้องเป็นอลูมิเนียมกระจก โปร่งโล่ง เห็น เพื่อนที่มาพักห้องข้างๆ น้องหมาไม่เครียด
    - ของแต่งห้องมีเตียงนอน ของเล่น ชามข้าว ผ้าปูที่นอนและเสื้อกันหนาวให้
    """
    serviceTitleLabel.text = "บริการเสริม"
    serviceLabel.text = """
    - อาหาร Royal Canin 2 มื้อ
    - มีแม่บ้านดูแลทำความสะอาด
    - มีพี่เลี้ยงพาวิ่งเล่นอิสระในสนามหญ้า 2-3 เวลา
    - ระหว่างวันมีพี่เลี้ยงเข้าห้องไปเล่นและเช็ค สุขภาพโดยรวมของน้องหมาทุกวัน
    """
  }
  
  @objc func buttonTouchUpInside(_ sender: UIButton) {
    print(#function, sender)
    let vc = BookingVC()
    vc.dummyText = String(describing: Self.self)
    let nc = UINavigationController(rootViewController: vc)
    present(nc, animated: true)
  }
  
  func applyProperties() {
    navigationItem.title = String(describing: Self.self)
    detailTitleLabel.numberOfLines = 1
    detailLabel.numberOfLines = 0
    serviceTitleLabel.numberOfLines = 1
    serviceLabel.numberOfLines = 0
  }
  
  func applyTheme() {
//    view.backgroundColor = colorScheme.backgroundColor
    imageView.image = UIImage(color: .red, size: CGSize(width: 1, height: 1))
    infomationView.backgroundColor = .gray
    detailTitleLabel.backgroundColor = .green
    detailLabel.backgroundColor = .blue
    serviceTitleLabel.backgroundColor = .green
    serviceLabel.backgroundColor = .blue
    
    detailTitleLabel.font = typographyScheme.subtitle1
    detailTitleLabel.textColor = colorScheme.onSurfaceColor
    detailLabel.font = typographyScheme.body2
    detailLabel.textColor = colorScheme.onSurfaceColor
    
    serviceTitleLabel.font = typographyScheme.subtitle1
    serviceTitleLabel.textColor = colorScheme.onSurfaceColor
    serviceLabel.font = typographyScheme.body2
    serviceLabel.textColor = colorScheme.onSurfaceColor
    
    bookButton.setBackgroundImage(UIImage(color: .black, size: CGSize(width: 1, height: 1)),
    for: [])
    setNeedsStatusBarAppearanceUpdate()
  }
  
}
