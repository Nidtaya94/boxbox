//
//  HomeBottomNavigationBarController.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//
import UIKit

import MaterialComponents.MaterialIcons
import MaterialComponentsBeta.MaterialBottomNavigationBeta

extension HomeBottomNavigationBarController:
  ViewApplicable,
  UIGestureRecognizerDelegate,
  MDCBottomNavigationBarControllerDelegate
{

}

class HomeBottomNavigationBarController: MDCBottomNavigationBarController {
  
  var vc01: ServiceVC = {
    let vc = ServiceVC()
    return vc
  }()
  var vc02: ActivityVC = {
     let vc = ActivityVC()
     return vc
   }()
//  var vc03: ProfileVC = {
//     let vc = ProfileVC()
//     return vc
//   }()
  var vc03: ListVC = {
    let vc = ListVC()
    return vc
  }()
  
  var nc01: UINavigationController!
  var nc02: UINavigationController!
  var nc03: UINavigationController!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nc01 = UINavigationController(rootViewController: vc01)
    nc02 = UINavigationController(rootViewController: vc02)
    nc03 = UINavigationController(rootViewController: vc03)
    nc01.tabBarItem = UITabBarItem(title: "Home",
                                   image: UIImage(named: "mdc_home"), tag: 0)
    nc02.tabBarItem = UITabBarItem(title: "Activity",
                                   image: MDCIcons.imageFor_ic_reorder(), tag: 1)
    nc03.tabBarItem = UITabBarItem(title: "Profile",
                                   image: MDCIcons.imageFor_ic_settings(), tag: 2)
    viewControllers = [
      nc01,
      nc02,
      nc03
    ]
    applyView()
  }
  
  func applyAutoLayout() {
    
  }
  
  func applyProperty() {
    navigationBar.delegate = self
    navigationBar.titleVisibility = .never
    navigationBar.alignment = .justifiedAdjacentTitles
  }
  
  func applyLocalize() {
//    vc01.dummyText = String(describing: ServiceVC.self)
    vc02.dummyText = String(describing: ActivityVC.self)
//    vc03.dummyText = String(describing: ProfileVC.self)
  }
  
  func applyStyle() {
    view.backgroundColor = .white
  }

  override func bottomNavigationBar(_ bottomNavigationBar: MDCBottomNavigationBar, shouldSelect item: UITabBarItem) -> Bool {
    if selectedIndex == item.tag {
      if let nav = selectedViewController as? UINavigationController {
        if nav.viewControllers.count < 2, !(nav.topViewController?.isScrolledToTop ?? true) {
          nav.topViewController?.scrollToTop()
        } else {
          nav.popToRootViewController(animated: true)
        }
      }
      return false
    } else {
      return true
    }
  }
  
}
