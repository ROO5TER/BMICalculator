//
//  UIViewExtensions.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 05/05/2023.
//

import UIKit

extension UIView {
    enum ShadowColor {
        case white
        case purple
        
        var cgColor: CGColor {
            switch self {
            case .white: return UIColor.white.cgColor
            case .purple: return UIColor.purple.cgColor
            }
        }
    }
    
    func addShadow(color: ShadowColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 10
    }
}
