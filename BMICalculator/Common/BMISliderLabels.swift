//
//  SliderLabels.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 28/04/2023.

import UIKit

struct SliderLabelsViewModel {
    var leftSideText: String
    var rightSideText: String
}

final class BMISliderLabels: UIView {
    private let stackView = UIStackView()
    private let leftSideLabel = UILabel()
    private let rightSideLabel = UILabel()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupStyling()
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyling() {
        setupStackViewStyling()
        setupLeftSideLabelStyling()
        setupRightSideLabelStyling()
        addShadow(color: .purple)
    }
    
    private func setupStackViewStyling() {
        stackView.axis = .horizontal
        stackView.alignment = .fill
    }
    
    private func setupLeftSideLabelStyling() {
        leftSideLabel.font = .systemFont(ofSize: 25, weight: .regular)
        leftSideLabel.textColor = .white
        leftSideLabel.shadowColor = .black
    }
    
    private func setupRightSideLabelStyling() {
        rightSideLabel.font = .systemFont(ofSize: 25, weight: .regular)
        rightSideLabel.textColor = .white
        rightSideLabel.shadowColor = .black
        rightSideLabel.textAlignment = .right
    }
    
    func configure(viewModel: SliderLabelsViewModel) {
        leftSideLabel.text = viewModel.leftSideText
        rightSideLabel.text = viewModel.rightSideText
    }
    
    private func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(leftSideLabel)
        stackView.addArrangedSubview(rightSideLabel)
    }
    
    private func addConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
