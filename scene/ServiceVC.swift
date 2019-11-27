//
//  ServiceVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

struct ServiceVCModel {
  
  enum SectionKind: String, CaseIterable {
    case base
  }
  
  enum ItemId: String, CaseIterable {
    case base
  }
  
  struct Section: ListSection {
    var kind: String = ""
    var items: [ListItem] = []
  }
  
  struct Item: ListItem {
    var id: String = ""
    var model: ServiceViewCellModel
  }
  
  var sections: [Section] = []
  
}

extension ServiceVC:
  ViewApplicable,
  MDCAlertDelegate,
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout,
  ServiceViewCellDelegate
{
  
}

class ServiceVC: UIViewController {
  
  var serviceVCModel = ServiceVCModel()
  var serviceResponseData = ServiceResponseData()
  
  var collectionView: UICollectionView = {
    let collectionView = UIFactory.collectionView
    return collectionView
  }()
  var collectionViewLayout: UICollectionViewLayout =  {
    let collectionViewLayout = UIFactory.collectionViewLayout
    return collectionViewLayout
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubviews([collectionView])
    applyView()
    fetchService()
  }
  
  func applyAutoLayout() {
    collectionView.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
  }
  
  func applyProperty() {
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.collectionViewLayout = collectionViewLayout
    collectionView.register(cellWithClass: ServiceViewCell.self)
    collectionView.contentInset = UIEdgeInsets(top: UIConstant.lowSpace, left: 0, bottom: UIConstant.lowSpace, right: 0)
  }
  
  func applyLocalize() {
    navigationItem.title = String(describing: Self.self)
  }
  
  func applyStyle() {
    view.backgroundColor = colorScheme.backgroundColor
    collectionView.backgroundColor = colorScheme.backgroundColor
    collectionViewLayout.invalidateLayout()
    collectionView.reloadData()
  }
  
  func displayService() {
    collectionViewLayout.invalidateLayout()
    collectionView.reloadData()
  }
  
}

extension ServiceVC {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return serviceVCModel.sections.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return serviceVCModel.sections[section].items.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let section = serviceVCModel.sections[indexPath.section]
    let item = section.items[indexPath.item]
    switch section.kind {
    case ServiceVCModel.SectionKind.base.rawValue:
      let item = item as! ServiceVCModel.Item
      let cell = collectionView.dequeueReusableCell(withClass: ServiceViewCell.self, for: indexPath)
      cell.delegate = self
      cell.applyModel(item.model)
      return cell
    default:
      fatalError(#function)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    let section = serviceVCModel.sections[indexPath.section]
    switch section.kind {
    case ServiceVCModel.SectionKind.base.rawValue:
      break
    default:
      break
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    let section = serviceVCModel.sections[indexPath.section]
    switch section.kind {
    case ServiceVCModel.SectionKind.base.rawValue:
      break
    default:
      break
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let item = serviceVCModel.sections[indexPath]
    let vc = ServiceDetailVC()
    vc.serviceType = item.id
    navigationController?.pushViewController(vc, animated: true)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let section = serviceVCModel.sections[section]
    let inset: UIEdgeInsets
    switch section.kind {
    case ServiceVCModel.SectionKind.base.rawValue:
      inset = .zero
    default:
      inset = .zero
    }
    return inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    let section = serviceVCModel.sections[section]
    let spacing: CGFloat
    switch section.kind {
    case ServiceVCModel.SectionKind.base.rawValue:
      spacing = .zero
    default:
      spacing = .zero
    }
    return spacing
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    let section = serviceVCModel.sections[section]
    let spacing: CGFloat
    switch section.kind {
    case ServiceVCModel.SectionKind.base.rawValue:
      spacing = .zero
    default:
      spacing = .zero
    }
    return spacing
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let section = serviceVCModel.sections[indexPath.section]
    let size: CGSize
    switch section.kind {
    case ServiceVCModel.SectionKind.base.rawValue:
      size = CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width)
    default:
      size = .zero
    }
    return size
  }
  
  func serviceViewCell(_ collectionViewCell: UICollectionViewCell, didAction action: String) {
    guard let indexPath = collectionView.indexPath(for: collectionViewCell) else {
      fatalError(#function)
    }
    let item = serviceVCModel.sections[indexPath]
    let vc = BookingFilterVC()
    vc.serviceType = item.id
    let nc = UINavigationController(rootViewController: vc)
    nc.modalPresentationStyle = .fullScreen
    present(nc, animated: true)
  }
  
}

extension ServiceVC {
  
  func fetchService() {
    serviceResponseData = ServiceResponseData()
    let section = mapServiceSection()
    serviceVCModel.sections = [
      section
    ]
    displayService()
  }
  
  func mapServiceSection() -> ServiceVCModel.Section {
    var section = ServiceVCModel.Section(kind: ServiceVCModel.SectionKind.base.rawValue)
    for i in serviceResponseData.data ?? [] {
      var model = ServiceViewCellModel()
      model.imageURL = URL(string: i.title ?? "")
      model.iconImage = UIImage(named: i.type ?? "")
      model.title = i.title
      model.subtitle = i.subtitle
      let item = ServiceVCModel.Item(id: i.type ?? "",
                                     model: model)
      section.items.append(item)
    }
    return section
  }
  
}
