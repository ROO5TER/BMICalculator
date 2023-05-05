//
//  ViewController.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 14/04/2023.
//

import UIKit

class MainViewController: UIViewController {
    private let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    private let button: BMIButton = .init()
    private let upperSlider: BMISlider = .init()
    private let lowerSlider: BMISlider = .init()
    private let upperSliderLabels: BMISliderLabels = .init()
    private let lowerSliderLabels: BMISliderLabels = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyling()
        configure()
        addSubviews()
        addConstraints()
    }
    
    @objc func upperSliderMoves(_ sender: UISlider!) {
        let roundedValue = String(format: "%.2f", sender.value)
        upperSliderLabels.configure(viewModel: .init(
            leftSideText: Localizable.MainViewController.leftUpperText,
            rightSideText: Localizable.MainViewController.rightUpperText(roundedValue)
        ))
    }
    
    @objc func lowerSliderMoves(_ sender: UISlider!) {
        let roundedValue = String(format: "%.2f", sender.value)
        lowerSliderLabels.configure(viewModel: .init(
            leftSideText: Localizable.MainViewController.lefttLowerText,
            rightSideText: Localizable.MainViewController.rightLowerText(roundedValue)
        ))
    }
    
    @objc func buttonTapped() {
        print("Button tapped!")
    }
    
    private func setupStyling() {
        backgroundImage.image = SharedAsset.background.image
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func configure() {
        button.configure(viewModel: .init(
            title: Localizable.MainViewController.buttonTitle,
            action: #selector(buttonTapped)
        ))
        
        upperSlider.configure(viewModel: .init(
            action: #selector(upperSliderMoves)
        ))
        
        lowerSlider.configure(viewModel: .init(
            action: #selector(lowerSliderMoves)
        ))
        
        upperSliderLabels.configure(viewModel: .init(
            leftSideText: Localizable.MainViewController.leftUpperText,
            rightSideText: Localizable.MainViewController.rightUpperText("100")
        ))
        
        lowerSliderLabels.configure(viewModel: .init(
            leftSideText: Localizable.MainViewController.lefttLowerText,
            rightSideText: Localizable.MainViewController.rightLowerText("100")
        ))
    }
    
    private func addSubviews() {
        self.view.addSubview(backgroundImage)
        self.view.addSubview(button)
        self.view.addSubview(upperSlider)
        self.view.addSubview(lowerSlider)
        self.view.addSubview(upperSliderLabels)
        self.view.addSubview(lowerSliderLabels)
        
    }
    
    private func addConstraints() {
        addButtonConstraints()
        addUpperSliderConstraints()
        addLowerSliderConstraints()
        addUpperLabelsConstraints()
        addLowerLabelsConstraints()
    }
    
    private func addButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func addUpperSliderConstraints() {
        lowerSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowerSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lowerSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lowerSlider.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -60)
        ])
    }
    
    private func addLowerSliderConstraints() {
        upperSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            upperSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            upperSlider.bottomAnchor.constraint(equalTo: lowerSlider.topAnchor, constant: -60)
        ])
    }
    
    private func addUpperLabelsConstraints() {
        lowerSliderLabels.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowerSliderLabels.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lowerSliderLabels.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            lowerSliderLabels.bottomAnchor.constraint(equalTo: lowerSlider.topAnchor, constant: -10)
        ])
    }
    
    private func addLowerLabelsConstraints() {
        upperSliderLabels.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperSliderLabels.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            upperSliderLabels.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            upperSliderLabels.bottomAnchor.constraint(equalTo: upperSlider.topAnchor, constant: -10)
        ])
    }
}

