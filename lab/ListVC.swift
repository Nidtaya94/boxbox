//
//  ListVC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 17/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import SwifterSwift
import SnapKit

import MaterialComponents.MaterialIcons

struct ListVCDataModel {
  
  enum SectionKind: String, CaseIterable {
    case base
  }
  
  enum ItemId: String, CaseIterable {
    case frist
    case second
    case thrid
  }
  
  struct Section: ListSection {
    var kind: String = ""
    var footer: Footer?
    var items: [ListItem] = []
  }
  
  struct Footer: ListItem {
    var id: String = ""
    var model: ListReusableViewModel
  }
  
  struct Item: ListItem {
    var id: String = ""
    var model: ListViewCellModel
  }
  
  var sections: [Section] = []
  
}

extension ListVC:
  ViewApplicable,
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout
{
  
}

class ListVC: UIViewController {
  
  var listVCDataModel = ListVCDataModel()
  
  var collectionView = UIFactory.collectionView
  var collectionViewLayout = UIFactory.collectionViewLayout
  let loadingView: LoadingView = {
    let view = LoadingView()
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubviews([collectionView, loadingView])
    applyView()
    fetchData()
  }
  
  func applyAutoLayout() {
    collectionView.snp.makeConstraints {
      $0.top.equalTo(view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
    loadingView.snp.makeConstraints {
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
    collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withClass: ListReusableView.self)
    collectionView.register(cellWithClass: ListViewCell.self)
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

  func collectionViewReloadData() {
    collectionViewLayout.invalidateLayout()
    collectionView.reloadData()
  }
  
}

extension ListVC {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return listVCDataModel.sections.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return listVCDataModel.sections[section].items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let section = listVCDataModel.sections[indexPath.section]
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      switch kind {
      case UICollectionView.elementKindSectionHeader:
        fatalError(#function)
      case UICollectionView.elementKindSectionFooter:
        guard let footer = section.footer else {
          fatalError(#function)
        }
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withClass: ListReusableView.self, for: indexPath)
        supplementaryView.tag = indexPath.section
        supplementaryView.contentStackView.alignment = .top
        supplementaryView.titleLabel.textAlignment = .right
        supplementaryView.applyModel(footer.model)
        supplementaryView.titleLabel.textColor = supplementaryView.titleLabel.textColor.withAlphaComponent(UIConstant.dateColorOpacity)
        supplementaryView.setNeedsLayout()
        supplementaryView.layoutIfNeeded()
        return supplementaryView
      default:
        fatalError(#function)
      }
    default:
      fatalError(#function)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let section = listVCDataModel.sections[indexPath.section]
    let item = section.items[indexPath.item]
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      let item = item as! ListVCDataModel.Item
      let cell = collectionView.dequeueReusableCell(withClass: ListViewCell.self, for: indexPath)
      cell.applyModel(item.model)
      cell.applyCenterVerticalStyle()
      cell.trailingImageView.contentMode = .right
      cell.setNeedsLayout()
      cell.layoutIfNeeded()
      return cell
    default:
      fatalError(#function)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    let section = listVCDataModel.sections[indexPath.section]
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      break
    default:
      break
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    let section = listVCDataModel.sections[indexPath.section]
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      break
    default:
      break
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    _ = listVCDataModel.sections[indexPath.section]
    let item = listVCDataModel.sections[indexPath.section].items[indexPath.item]
    switch item.id {
    case ListVCDataModel.SectionKind.base.rawValue:
      break
    default:
      break
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    let section = listVCDataModel.sections[section]
    let size: CGSize
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      size =  CGSize(width: collectionView.bounds.width, height: 0)
    default:
      size = .zero
    }
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    let section = listVCDataModel.sections[section]
    let size: CGSize
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      size =  CGSize(width: collectionView.bounds.width, height: ListReusableView.Constant.lowHeight)
    default:
      size = .zero
    }
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let section = listVCDataModel.sections[section]
    let inset: UIEdgeInsets
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    default:
      inset = .zero
    }
    return inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    let section = listVCDataModel.sections[section]
    let spacing: CGFloat
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      spacing = .zero
    default:
      spacing = .zero
    }
    return spacing
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    let section = listVCDataModel.sections[section]
    let spacing: CGFloat
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      spacing = .zero
    default:
      spacing = .zero
    }
    return spacing
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let section = listVCDataModel.sections[indexPath.section]
    let size: CGSize
    switch section.kind {
    case ListVCDataModel.SectionKind.base.rawValue:
      size = CGSize(width: collectionView.bounds.width, height: ListViewCell.Constant.lowHeight)
    default:
      size = .zero
    }
    return size
  }
  
}

extension ListVC {
  
  func fetchData() {
    let section = mapCollectionDataSourceSection()
    listVCDataModel.sections = [
      section
    ]
    collectionViewReloadData()
  }
  
  func mapCollectionDataSourceSection() -> ListVCDataModel.Section {
    var section = ListVCDataModel.Section(kind: ListVCDataModel.SectionKind.base.rawValue)
    let footerTitle = "v \("0").\("0")"
    let footerDisplayer = ListReusableViewModel(title: footerTitle,
                                                detail: "",
                                                trailingButtonTitle: nil,
                                                trailingButtonImg: nil)
    section.footer = ListVCDataModel.Footer(id: "", model: footerDisplayer)
    for i in ListVCDataModel.ItemId.allCases {
      var title: String
      let trailingImg: UIImage?
      switch i {
      case .frist:
        title = i.rawValue
        trailingImg = MDCIcons.imageFor_ic_chevron_right()?.withRenderingMode(.alwaysTemplate)
      case .second:
        title = i.rawValue
        trailingImg = MDCIcons.imageFor_ic_chevron_right()?.withRenderingMode(.alwaysTemplate)
      case .thrid:
        title = i.rawValue
        trailingImg = nil
      }
      let model = ListViewCellModel(title: title,
                                    detail: "",
                                    leadingImg: nil,
                                    trailingImg: trailingImg)
      let item = ListVCDataModel.Item(id: i.rawValue, model: model)
      section.items.append(item)
    }
    return section
  }
  
}
