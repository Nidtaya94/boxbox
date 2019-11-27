//
//  MDCButton+Extension.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 21/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import MaterialComponents.MDCButton

extension MDCButton {
  
  static var maximumStateValue: [UIControl.State] {
    return [.normal, .selected, .highlighted, .disabled]
  }
  
  func resetTitleFontForAllStates() {
    for state in MDCButton.maximumStateValue {
      setTitleFont(nil, for: state)
    }
  }
  
  func resetButtonColorsForAllStates() {
    for state in MDCButton.maximumStateValue {
      setBackgroundColor(nil ,for: state)
      setTitleColor(nil ,for: state)
      setImageTintColor(nil ,for: state)
      setBorderColor(nil ,for: state)
    }
  }
  
  func applyOutlined(_ scheme: MDCContainerScheming) {
    let colorScheme = scheme.colorScheme
    applyOutlinedWithColorScheme(colorScheme)
    if let shapeScheme = scheme.shapeScheme {
      applyOutlinedWithShapeScheme(shapeScheme)
    } else {
      layer.cornerRadius = 4
    }
    let typographyScheme = scheme.typographyScheme
    applyOutlinedWithTypographyScheme(typographyScheme)
    
    setElevation(.none, for: .normal)
    setElevation(.none, for: .highlighted)
    setElevation(.none, for: .disabled)
    
    minimumSize = CGSize(width: 0, height: 36)
    for state in MDCButton.maximumStateValue {
      setBorderWidth(1, for: state)
    }
  }
  
  private func applyOutlinedWithColorScheme(_ colorScheme: MDCColorScheming) {
    resetButtonColorsForAllStates()
    let disabledContentColor = colorScheme.onSurfaceColor.withAlphaComponent(0.38)
    let borderColor = colorScheme.onSurfaceColor.withAlphaComponent(0.12)
    setBackgroundColor(UIColor.clear, for: .normal)
    setTitleColor(colorScheme.primaryColor, for: .normal)
    setTitleColor(disabledContentColor, for: .disabled)
    disabledAlpha = 1
    setImageTintColor(colorScheme.primaryColor, for: .normal)
    setImageTintColor(disabledContentColor, for: .disabled)
    inkColor = colorScheme.primaryColor.withAlphaComponent(0.12)
    setBorderColor(borderColor, for: .normal)
  }
  
  private func applyOutlinedWithTypographyScheme(_ typographyScheme: MDCTypographyScheming) {
    resetTitleFontForAllStates()
  }
  
  private func applyOutlinedWithShapeScheme(_ shapeScheme: MDCShapeScheming) {
    MDCButtonShapeThemer.applyShapeScheme(shapeScheme, to: self)
  }
  
  func applyContained(_ scheme: MDCContainerScheming) {
    let colorScheme = scheme.colorScheme
    applyContainedWithColorScheme(colorScheme)
    if let shapeScheme = scheme.shapeScheme {
      applyContainedWithShapeScheme(shapeScheme)
    } else {
      layer.cornerRadius = 4
    }
    let typographyScheme = scheme.typographyScheme
    applyContainedWithTypographyScheme(typographyScheme)
    
    setElevation(.raisedButtonResting, for: .normal)
    setElevation(.raisedButtonPressed, for: .highlighted)
    setElevation(.none, for: .disabled)
    
    minimumSize = CGSize(width: 0, height: 36)
  }
  
  private func applyContainedWithColorScheme(_ colorScheme: MDCColorScheming) {
    resetButtonColorsForAllStates()
    MDCContainedButtonColorThemer.applySemanticColorScheme(colorScheme, to: self)
  }
  
  private func applyContainedWithTypographyScheme(_ typographyScheme: MDCTypographyScheming) {
    resetTitleFontForAllStates()
    setTitleFont(typographyScheme.button, for: .normal)
  }
  
  private func applyContainedWithShapeScheme(_ shapeScheme: MDCShapeScheming) {
    MDCButtonShapeThemer.applyShapeScheme(shapeScheme, to: self)
  }
  
  func applyText(_ scheme: MDCContainerScheming) {
    let colorScheme = scheme.colorScheme
    applyTextWithColorScheme(colorScheme)
    if let shapeScheme = scheme.shapeScheme {
      applyTextWithShapeScheme(shapeScheme)
    } else {
      layer.cornerRadius = 4
    }
    let typographyScheme = scheme.typographyScheme
    applyTextWithTypographyScheme(typographyScheme)
    
    for state in MDCButton.maximumStateValue {
      setElevation(.none, for: state)
    }
    minimumSize = CGSize(width: 0, height: 36)
  }
  
  private func applyTextWithColorScheme(_ colorScheme: MDCColorScheming) {
    resetButtonColorsForAllStates()
    MDCTextButtonColorThemer.applySemanticColorScheme(colorScheme, to: self)
  }
  
  private func applyTextWithTypographyScheme(_ typographyScheme: MDCTypographyScheming) {
    resetTitleFontForAllStates()
    setTitleFont(typographyScheme.button, for: .normal)
  }
  
  private func applyTextWithShapeScheme(_ shapeScheme: MDCShapeScheming) {
    MDCButtonShapeThemer.applyShapeScheme(shapeScheme, to: self)
  }
  
}
