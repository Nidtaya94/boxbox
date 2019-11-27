//
//  AppError.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import Foundation

enum AppError: Error, LocalizedError {
  
  case unknown
  case custom(String)
  case input(String)
  case parse(String)
  case network(String)
  case notHandled(String)

  var errorDescription: String? {
    var result = ""
    switch self {
    case .unknown:
      result = "Something went wrong."
    case let .custom(message):
      result = message
    case let .input(message):
      result = "Input \(message)."
    case let .parse(message):
      result = "Parse \(message)."
    case let .network(message):
      result = "Network \(message)."
    case let .notHandled(message):
      result = "Not handled \(message)."
    }
    return result
  }
}
