//
//  AlertDelegate.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

protocol AlertDelegate {
  
}

extension AlertDelegate where Self: UIViewController {

  func displaySuccessAlert(_ message: String) {
    let alert = UIAlertController(title: "SUCCESS", message: message, preferredStyle: .alert)
    let doneAction = UIAlertAction(title: "DONE", style: .default, handler: nil)
    alert.addAction(doneAction)
    present(alert, animated: true, completion: nil)
  }
  
  func displayErrorAlert(_ error: Error) {
    let alert = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "CANCEL", style: .cancel, handler: nil)
    alert.addAction(cancelAction)
    present(alert, animated: true, completion: nil)
  }
  
}

