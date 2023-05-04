//
//  BMISlider.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 26/04/2023.
//

import UIKit

struct BMISliderViewModel {
    let action: Selector
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
        minimumValue = 0
        maximumValue = 200
        value = 100
    }
    
    func configure(viewModel: BMISliderViewModel) {
        addTarget(BMISlider(), action: viewModel.action, for: .valueChanged)
    }
}
