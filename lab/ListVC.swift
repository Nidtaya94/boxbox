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

struct ListVCDataSource {
  
  enum SectionKind: String, CaseIterable {
    case none
  }
  enum ItemId: String, CaseIterable {
    case frist
    case second
    case thrid
  }
  struct Section: ListSection {
    var kind: String = ""
    var footer: Footer! = .init()
    var items: [ListItem] = []
  }
  struct Footer: ListItem {
    var id: String = ""
    var displayed: ListReusableViewDisplayed!
  }
  struct Item: ListItem {
    var id: String = ""
    var displayed: ListViewCellDisplayed!
  }
  var sections: [Section] = []
  
}

extension ListVC:
  UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout
{
  
}

class ListVC: UIViewController {
  
  var dataSource = ListVCDataSource()
  
  var collectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.contentInsetAdjustmentBehavior = .always
    collectionView.setupScrollDefault()
    collectionView.setupScrollVertical()
    collectionView.register(supplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withClass: CollectionReusableView.self)
    collectionView.register(cellWithClass: CollectionViewCell.self)
    return collectionView
  }()
  
  var collectionViewLayout: UICollectionViewFlowLayout = {
    let layout = UICollectionViewFlowLayout()
    layout.sectionHeadersPinToVisibleBounds = true
    layout.sectionFootersPinToVisibleBounds = true
    return layout
  }()
  
  let loadingView: LoadingView = {
    let view = LoadingView()
    return view
  }()
  
  override var prefersStatusBarHidden: Bool {
    return false
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.collectionViewLayout = collectionViewLayout
    view.addSubview(collectionView)
    view.addSubview(loadingView)
    collectionView.snp.makeConstraints {
      $0.top.equalTo(self.view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(self.view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
    loadingView.snp.makeConstraints {
      $0.top.equalTo(self.view.snp.topMargin)
      $0.right.equalToSuperview()
      $0.bottom.equalTo(self.view.snp.bottomMargin)
      $0.left.equalToSuperview()
    }
    applyProperties()
    applyTheme()
    fetchDataSoruce()
  }
  
  func applyProperties() {
    navigationItem.title = String(describing: Self.self)
  }
  
  func applyTheme() {
    view.backgroundColor = colorScheme.backgroundColor
    collectionView.backgroundColor = colorScheme.backgroundColor
    collectionViewLayout.invalidateLayout()
    collectionView.reloadData()
    setNeedsStatusBarAppearanceUpdate()
  }
  func fetchDataSoruce() {
      let section = mapCollectionDataSourceSection()
      dataSource.sections = [
        section
      ]
      collectionViewLayout.invalidateLayout()
      collectionView.reloadData()
    }
    
  func mapCollectionDataSourceSection() -> ListVCDataSource.Section {
    var section = ListVCDataSource.Section(kind: ListVCDataSource.SectionKind.none.rawValue,
                                               footer: .init(),
                                               items: [])
    section.footer.displayed = ListReusableViewDisplayed(title: "v \(UIApplication.shared.version ?? "0").\(UIApplication.shared.buildNumber ?? "0")",
      detail: "",
      trailingButtonTitle: nil,
      trailingButtonImg: nil)
    
    for i in ListVCDataSource.ItemId.allCases {
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
      let displayed = ListViewCellDisplayed(title: title,
                                                  detail: "",
                                                  leadingImg: nil,
                                                  trailingImg: trailingImg)
      let item = ListVCDataSource.Item(id: i.rawValue, displayed: displayed)
      section.items.append(item)
    }
    return section
  }
  
}

extension ListVC {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return dataSource.sections.count
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      numberOfItemsInSection section: Int) -> Int {
    return dataSource.sections[section].items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let section = dataSource.sections[indexPath.section]
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      switch kind {
      case UICollectionView.elementKindSectionHeader:
          fatalError(#function)
      case UICollectionView.elementKindSectionFooter:
          let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withClass: CollectionReusableView.self, for: indexPath)
          supplementaryView.tag = indexPath.section
          supplementaryView.contentStackView.alignment = .top
          supplementaryView.titleLabel.textAlignment = .right
          supplementaryView.populate(section.footer.displayed)
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
    let section = dataSource.sections[indexPath.section]
    let item = section.items[indexPath.item]
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      let item = item as! ListVCDataSource.Item
      let cell = collectionView.dequeueReusableCell(withClass: CollectionViewCell.self, for: indexPath)
      cell.populate(item.displayed)
      cell.applyCenterVerticalStyle()
      cell.trailingImgv.contentMode = .right
      cell.setNeedsLayout()
      cell.layoutIfNeeded()
      return cell
    default:
      fatalError(#function)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    let section = dataSource.sections[indexPath.section]
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      break
    default:
      break
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    let section = dataSource.sections[indexPath.section]
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      break
    default:
      break
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    let section = dataSource.sections[indexPath.section]
    let item = dataSource.sections[indexPath.section].items[indexPath.item]
    switch item.id {
    case ListVCDataSource.SectionKind.none.rawValue:
      break
    default:
      break
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    let section = dataSource.sections[section]
    let size: CGSize
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      size =  CGSize(width: collectionView.bounds.width, height: 0)
    default:
      size = .zero
    }
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    let section = dataSource.sections[section]
    let size: CGSize
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      size =  CGSize(width: collectionView.bounds.width, height: CollectionReusableView.Constant.lowHeight)
    default:
      size = .zero
    }
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    let section = dataSource.sections[section]
    let inset: UIEdgeInsets
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    default:
      inset = .zero
    }
    return inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    let section = dataSource.sections[section]
    let spacing: CGFloat
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      spacing = .zero
    default:
      spacing = .zero
    }
    return spacing
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    let section = dataSource.sections[section]
    let spacing: CGFloat
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      spacing = .zero
    default:
      spacing = .zero
    }
    return spacing
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let section = dataSource.sections[indexPath.section]
    let size: CGSize
    switch section.kind {
    case ListVCDataSource.SectionKind.none.rawValue:
      size = CGSize(width: collectionView.bounds.width, height: CollectionViewCell.Constant.lowHeight)
    default:
      size = .zero
    }
    return size
  }
  
}
