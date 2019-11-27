//
//  ActionSheetDelegate.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialActionSheet

protocol ActionSheetDelegate {
  
}

extension ActionSheetDelegate where Self: UIViewController {

  func displayTestActionSheet() {
    let actionSheet = MDCActionSheetController(title: "Action Sheet",
                                               message: "Secondary line text")
    let oneAction = MDCActionSheetAction(title: "Home",
                                         image: UIImage(named: "mdc_home"),
                                         handler:
      { (action) in
        print("\(action.title) action")
    })
    let twoAction = MDCActionSheetAction(title: "Email",
                                         image: UIImage(named: "mdc_email"),
                                         handler:
      { (action) in
        print("\(action.title) action")
    })
    actionSheet.addAction(oneAction)
    actionSheet.addAction(twoAction)
    present(actionSheet, animated: true, completion: nil)
  }
  
}

