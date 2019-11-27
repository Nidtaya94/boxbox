//
//  MDCAlertDelegate.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import MaterialComponents.MDCAlertController

protocol MDCAlertDelegate {
  
}

extension MDCAlertDelegate where Self: UIViewController {

  func displaySuccessMDCAler(_ message: String) {
      let alert = MDCAlertController(title: "SUCCESS", message: message)
      let doneAction = MDCAlertAction(title: "DONE", handler: nil)
      alert.addAction(doneAction)
  //    alert.applyTheme(withScheme: containerScheme)
      present(alert, animated: true, completion: nil)
    }
  
  func displayErrorMDCAlert(_ error: Error) {
    let alert = MDCAlertController(title: "ERROR", message: error.localizedDescription)
    let cancelAction = MDCAlertAction(title: "CANCEL", handler: nil)
    alert.addAction(cancelAction)
//    alert.applyTheme(withScheme: containerScheme)
    present(alert, animated: true, completion: nil)
  }
  
}
