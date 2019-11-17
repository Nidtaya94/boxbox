//
//  UIResponder+MDC.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import MaterialComponents

extension UIResponder {

  var typographyScheme: MDCTypographyScheming { return MDCTheme.theme.typographyScheme }
  var colorScheme: MDCColorScheming { return MDCTheme.theme.colorScheme }
  var containerScheme: MDCContainerScheming { return MDCTheme.theme }
  
}
