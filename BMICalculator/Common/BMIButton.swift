//
//  BMIButton.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 25/04/2023.
//

import UIKit

struct BMIButtonViewModel {
    let title: String
    let action: Selector
}

final class BMIButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyling()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: BMIButtonViewModel) {
        setTitle(viewModel.title, for: .normal)
        addTarget(BMIButton(), action: viewModel.action, for: .touchUpInside)
    }
    
    private func setupStyling() {
        setBackgroundImage(SharedAsset.buttonBackground.image, for: .normal)
        clipsToBounds = true
        layer.cornerRadius = 10
        titleLabel?.font = UIFont.systemFont(ofSize: 26, weight: .bold)
    }
}
