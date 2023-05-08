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
    
    func calculateBMI(weight: Float, height: Float) -> String {
        let heightInMeters = cmToMeters(value: height)
        let bmi = weight / (heightInMeters * heightInMeters)
        let roundedBmi = roundToTwoDecimalPlaces(value: bmi)
        return roundedBmi
    }
    
    private func cmToMeters(value: Float) -> Float {
        let meters = value / 100
        return meters
    }
}
