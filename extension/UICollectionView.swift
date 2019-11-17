//
//  UICollectionView.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

extension UICollectionView {
  
  func register(nibWithCellClass name: AnyClass, kind: String) {
    let identifier = String(describing: name.self)
    let nib = UINib(nibName: identifier, bundle: nil)
    self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
  }
  
  func register<T: UICollectionReusableView>(supplementaryViewOfKind kind: String, withClass name: T.Type) {
    register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
  }
  
}
