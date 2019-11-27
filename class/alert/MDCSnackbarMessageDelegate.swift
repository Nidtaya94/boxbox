//
//  MDCSnackbarMessageDelegate.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import MaterialComponents.MDCSnackbarManager

protocol MDCSnackbarMessageDelegate {
  
}

extension MDCSnackbarMessageDelegate where Self: UIViewController {

  func displaySuccessSnackbarMessage(_ message: String) {
    let snackbarMessage = MDCSnackbarMessage()
    snackbarMessage.text = message
    let actionHandler: MDCSnackbarMessageActionHandler = {
      
    }
    let action = MDCSnackbarMessageAction()
    action.title = "DONE"
    action.handler = actionHandler
    snackbarMessage.action = action
    snackbarMessage.enableRippleBehavior = true
    MDCSnackbarManager.show(snackbarMessage)
  }
  
  func displayErrorSnackbarMessage(_ error: Error) {
    let message = MDCSnackbarMessage()
    message.text = error.localizedDescription
    let actionHandler: MDCSnackbarMessageActionHandler = {
      
    }
    let action = MDCSnackbarMessageAction()
    action.title = "CANCEL"
    action.handler = actionHandler
    message.action = action
    message.enableRippleBehavior = true
    MDCSnackbarManager.show(message)
  }
  
}

