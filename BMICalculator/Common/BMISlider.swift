//
//  BMISlider.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 26/04/2023.
//

import UIKit

struct BMISliderViewModel {
    let action: Selector
    let minimumValue: Float
    let maximumValue: Float
    let value: Float
}

final class BMISlider: UISlider {
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyling() {
        setupSliderStyling()
    }
    
    private func setupSliderStyling() {
        thumbTintColor = .purple
        tintColor = .purple
        addShadow(color: .white)
    }
    
    func configure(viewModel: BMISliderViewModel) {
        minimumValue = viewModel.minimumValue
        maximumValue = viewModel.maximumValue
        value = viewModel.value
        addTarget(BMISlider(), action: viewModel.action, for: .valueChanged)
    }
}
