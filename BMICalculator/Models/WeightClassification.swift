//
//  Enum.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 10/05/2023.
//

import UIKit

enum WeightClassification {
    case underweight(value: String)
    case healthyWeight(value: String)
    case overweight(value: String)
    case obesity(value: String)
    
    var stringValue: String {
        switch self {
        case .underweight(let value):
            return value
        case .healthyWeight(let value):
            return value
        case .overweight(let value):
            return value
        case .obesity(let value):
            return value
        }
    }
    
    var color: UIColor {
        switch self {
        case .underweight:
            return .yellow
        case .healthyWeight:
            return .green
        case .overweight:
            return .orange
        case .obesity:
            return .red
        }
    }
    
    var image: UIImage {
        switch self {
        case .underweight:
            return SharedAsset.underweight.image
        case .healthyWeight:
            return SharedAsset.goodWeight.image
        case .overweight:
            return SharedAsset.overweight.image
        case .obesity:
            return SharedAsset.obesity.image
        }
    }
    
    var advice: String {
        switch self {
        case .underweight:
            return Localizable.WeightClassification.Advice.underweight
        case .healthyWeight:
            return Localizable.WeightClassification.Advice.healthyweight
        case .overweight:
            return Localizable.WeightClassification.Advice.overweight
        case .obesity:
            return Localizable.WeightClassification.Advice.obesity
        }
    }
}
