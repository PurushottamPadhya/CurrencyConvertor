//
//  Color.swift
//  CurrencyConvertor
//
//  Created by Purushottam Padhya on 25/1/22.
//

import UIKit

struct AppColor {
    
    static var Primary: UIColor {
        return UIColor(hex: "#13207f")
    }
    
    static var Secondary: UIColor {
        return .white
    }
    
    static var Background: UIColor {
        return AppColor.Secondary
    }
    
    static var containerView: UIColor {
        return AppColor.Background
    }
    
    static var TextColor: UIColor {
        return UIColor(hex: "#0a0a0a")
    }
    
    static var TextPlaceHolder: UIColor {
        return AppColor.TextColor.withAlphaComponent(0.7)
    }
    
    static var TextFieldBorderColor: UIColor {
        return AppColor.TextPlaceHolder
    }
  
    struct Button {
        static let Background = AppColor.Primary
        static let TextColor = AppColor.Secondary
    }
    
}
