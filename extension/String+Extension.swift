//
//  String+Extension.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

extension String {
  
  func lineSpaced(_ spacing: CGFloat) -> NSAttributedString {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = spacing
    let attributedString = NSAttributedString(string: self, attributes: [.paragraphStyle: paragraphStyle])
    return attributedString
  }
  
}
