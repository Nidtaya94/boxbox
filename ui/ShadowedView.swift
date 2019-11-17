//
//  ShadowedView.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit

import MaterialComponents.MDCShadowLayer

extension ShadowedView
{
  
}

class ShadowedView: UIView {
  
  override class var layerClass: AnyClass {
    return MDCShadowLayer.self
  }
  
  var shadowLayer: MDCShadowLayer {
    return self.layer as! MDCShadowLayer
  }
  
  func setDefaultElevation() {
    self.shadowLayer.elevation = ShadowElevation(rawValue: 2)
  }
  
  func setHilightElevation() {
    self.shadowLayer.elevation = ShadowElevation(rawValue: 4)
  }
  
}
