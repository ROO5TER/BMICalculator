//
//  BMIService.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 08/05/2023.
//

import Foundation

class BMIService {
    func roundToTwoDecimalPlaces(value: Float) -> String {
        let roundedValue = String(format: "%.2f", value)
        return roundedValue
    }
    
    func specifyWeightClassification(weight: Float, height: Float) -> WeightClassification {
        let bmi = calculateBMI(weight: weight, height: height)
        let roundedBmi = roundToTwoDecimalPlaces(value: bmi)
        if (...18.59).contains(bmi) {
            return .underweight(value: roundedBmi)
        } else if (18.6...24.99).contains(bmi) {
            return .healthyWeight(value: roundedBmi)
        } else if (25...29.99).contains(bmi) {
            return .overweight(value: roundedBmi)
        } else {
            return .obesity(value: roundedBmi)
        }
    }
    
    private func calculateBMI(weight: Float,height: Float) -> Float {
        let heightInMeters = cmToMeters(value: height)
        let bmi = weight / (heightInMeters * heightInMeters)
        return bmi
    }
    
    private func cmToMeters(value: Float) -> Float {
        let meters = value / 100
        return meters
    }
}
