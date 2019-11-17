//
//  UIViewController+Extension.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import WebKit

extension UIViewController {
  
  func scrollToTop() {
    func scrollToTop(view: UIView?) {
      guard let view = view else { return }
      switch view {
      case let scrollView as UIScrollView:
        if scrollView.scrollsToTop == true {
          scrollView.setContentOffset(CGPoint(x: 0.0, y: -scrollView.contentInset.top), animated: true)
          return
        }
      default:
        break
      }
      for subView in view.subviews {
        scrollToTop(view: subView)
      }
    }
    scrollToTop(view: view)
  }
  
  var isScrolledToTop: Bool {
    if self is UITableViewController {
      return (self as! UITableViewController).tableView.contentOffset.y == 0
    }
    for subView in view.subviews {
      if let scrollView = subView as? UIScrollView {
        return (scrollView.contentOffset.y == 0)
      } else if let webView = subView as? WKWebView {
        return (webView.scrollView.contentOffset.y == 0)
      }
    }
    return true
  }
  
}
