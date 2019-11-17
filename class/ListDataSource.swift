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

protocol dataSource {
  var sections: [ListSection] { get set }
}

extension dataSource {
  subscript(section: Int) -> ListSection {
    get {
      return sections[section]
    }
    set(newValue) {
      sections[section] = newValue
    }
  }
  subscript(indexPath: IndexPath) -> ListItem {
    get {
      return sections[indexPath.section].items[indexPath.row]
    }
    set(newValue) {
      sections[indexPath.section].items[indexPath.row] = newValue
    }
  }
}
