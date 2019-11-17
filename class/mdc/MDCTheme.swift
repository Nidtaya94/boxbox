//
//  MDCTheme.swift
//  boxbox
//
//  Created by NIdtaya Jamchoi on 16/11/2562 BE.
//  Copyright © 2562 Silpakorn. All rights reserved.
//

import UIKit
import MaterialComponents.MaterialContainerScheme

struct MDCTheme {
  
  static var theme: MDCContainerScheming {
    return darkContent
  }
  
  static var defaultContent: MDCContainerScheme {
    let containerScheme = MDCContainerScheme()
    
    let colorScheme = MDCSemanticColorScheme()
    colorScheme.primaryColor =  UIColor(red: CGFloat(0x21) / 255.0,
                                        green: CGFloat(0x21) / 255.0,
                                        blue: CGFloat(0x21) / 255.0,
                                        alpha: 1)
    colorScheme.primaryColorVariant = .init(white: 0.7, alpha: 1)
    colorScheme.secondaryColor = UIColor(red: CGFloat(0x00) / 255.0,
                                         green: CGFloat(0xE6) / 255.0,
                                         blue: CGFloat(0x76) / 255.0,
                                         alpha: 1)
    containerScheme.colorScheme = colorScheme
    
    let typographyScheme = MDCTypographyScheme()
    typographyScheme.headline1 = UIFont.systemFont(ofSize: 20)
    typographyScheme.headline2 = UIFont.systemFont(ofSize: 18)
    typographyScheme.headline3 = UIFont.systemFont(ofSize: 15)
    containerScheme.typographyScheme = typographyScheme
    
    let shapeScheme = MDCShapeScheme()
    containerScheme.shapeScheme = shapeScheme
    
    return containerScheme
  }
  
  static var darkContent: MDCContainerScheming {
    //    let colorScheme = MDCSemanticColorScheme()
    let colorScheme = MDCSemanticColorScheme(defaults: .material201804)
    colorScheme.primaryColor = MDCPalette.orange.tint500
    colorScheme.primaryColorVariant = MDCPalette.orange.tint900
    colorScheme.secondaryColor = MDCPalette.blue.tint900
    colorScheme.errorColor = MDCPalette.red.tint900
    colorScheme.surfaceColor = .white
    colorScheme.backgroundColor = .white
    colorScheme.onPrimaryColor = .white
    if let onPrimaryColor = MDFTextAccessibility.textColor(
      fromChoices: [
        MDCPalette.grey.tint100,
        MDCPalette.grey.tint900,
        UIColor.black,
        UIColor.white
      ],
      onBackgroundColor: colorScheme.primaryColor,
      options: .preferLighter) {
      colorScheme.onPrimaryColor = onPrimaryColor
    }
    colorScheme.onSecondaryColor = .white
    if let onSecondaryColor = MDFTextAccessibility.textColor(
      fromChoices: [
        MDCPalette.grey.tint100,
        MDCPalette.grey.tint900,
        UIColor.black,
        UIColor.white
      ],
      onBackgroundColor: colorScheme.secondaryColor,
      options: .preferLighter) {
      colorScheme.onSecondaryColor = onSecondaryColor
    }
    colorScheme.onSurfaceColor = .black
    colorScheme.onBackgroundColor = .black
    
//    let typographyScheme = MDCTypographyScheme()
    let typographyScheme = MDCTypographyScheme(defaults: .material201902)
//    typographyScheme.headline1 = UIFont.systemFont(ofSize: 20)
//    typographyScheme.headline2 = UIFont.systemFont(ofSize: 18)
//    typographyScheme.headline3 = UIFont.systemFont(ofSize: 15)
//    typographyScheme.headline4 =
//    typographyScheme.headline5 =
//    typographyScheme.headline6 =
//    typographyScheme.subtitle1 =
//    typographyScheme.subtitle2 =
//    typographyScheme.body1 =
//    typographyScheme.body2 =
//    typographyScheme.caption =
//    typographyScheme.button =
//    typographyScheme.overline =
    
    let shapeScheme = MDCShapeScheme()
//    shapeScheme.smallComponentShape
//    shapeScheme.mediumComponentShape
//    shapeScheme.largeComponentShape
    
    let containerScheme = defaultContent
    containerScheme.colorScheme = colorScheme
    containerScheme.typographyScheme = typographyScheme
    containerScheme.shapeScheme = shapeScheme
    return containerScheme
  }
  
}
