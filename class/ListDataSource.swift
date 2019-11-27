//
//  List.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 17/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import Foundation

protocol ListItem {
  var id: String { get set }
}

protocol ListSection {
  var kind: String { get set }
//  var header: ListItem? { get set }
//  var footer: ListItem? { get set }
  var items: [ListItem] { get set }
}

extension Array where Element: ListSection {
  
  subscript(indexPath: IndexPath) -> ListItem {
    get {
      return self[indexPath.section].items[indexPath.row]
    }
    set(newValue) {
      self[indexPath.section].items[indexPath.row] = newValue
    }
  }
  
}
