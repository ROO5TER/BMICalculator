//
//  ViewController.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 14/04/2023.
//

import UIKit

class MainViewController: UIViewController {
    private let bmiService = BMIService()
    private let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    private let mainViewIcon = UIImageView()
    private let titleLabel = UILabel()
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
        let roundedValue = bmiService.roundToTwoDecimalPlaces(value: sender.value)
        upperSliderLabels.configure(viewModel: .init(
            leftSideText: Localizable.MainViewController.leftUpperText,
            rightSideText: Localizable.MainViewController.rightUpperText(roundedValue)
        ))
    }
    
    @objc func lowerSliderMoves(_ sender: UISlider!) {
        let roundedValue = bmiService.roundToTwoDecimalPlaces(value: sender.value)
        lowerSliderLabels.configure(viewModel: .init(
            leftSideText: Localizable.MainViewController.lefttLowerText,
            rightSideText: Localizable.MainViewController.rightLowerText(roundedValue)
        ))
    }
    
    @objc func buttonTapped() {
        let clacification = bmiService.specifyWeightClassification(
            weight: upperSlider.value,
            height: lowerSlider.value
        )
        let resultViewController = ResultViewController(result: clacification)
        navigationController?.pushViewController(resultViewController, animated: true)
    }
    
    private func setupStyling() {
        setupBackground()
        setupTitleLabel()
        setupMainIcon()
    }
    
    private func setupBackground() {
        backgroundImage.image = SharedAsset.background.image
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupTitleLabel() {
        titleLabel.text = Localizable.MainViewController.titleLabelText
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.addShadow(color: .purple)
    }
    
    private func setupMainIcon() {
        mainViewIcon.image = SharedAsset.dumbellIcon.image
        mainViewIcon.tintColor = .white
        mainViewIcon.contentMode = .scaleAspectFit
        mainViewIcon.addShadow(color: .purple)
    }
    
    private func configure() {
        button.configure(viewModel: .init(
            title: Localizable.MainViewController.buttonTitle,
            action: #selector(buttonTapped)
        ))
        
        upperSlider.configure(viewModel: .init(
            action: #selector(upperSliderMoves),
            minimumValue: 20,
            maximumValue: 200,
            value: 80
        ))
        
        lowerSlider.configure(viewModel: .init(
            action: #selector(lowerSliderMoves),
            minimumValue: 50,
            maximumValue: 250,
            value: 170
        ))
        
        upperSliderLabels.configure(viewModel: .init(
            leftSideText: Localizable.MainViewController.leftUpperText,
            rightSideText: Localizable.MainViewController.rightUpperText("80")
        ))
        
        lowerSliderLabels.configure(viewModel: .init(
            leftSideText: Localizable.MainViewController.lefttLowerText,
            rightSideText: Localizable.MainViewController.rightLowerText("170")
        ))
    }
    
    private func addSubviews() {
        self.view.addSubview(backgroundImage)
        self.view.addSubview(titleLabel)
        self.view.addSubview(mainViewIcon)
        self.view.addSubview(button)
        self.view.addSubview(upperSlider)
        self.view.addSubview(lowerSlider)
        self.view.addSubview(upperSliderLabels)
        self.view.addSubview(lowerSliderLabels)
        
    }
    
    private func addConstraints() {
        addTitleLabelConstraints()
        addIconImageConstraints()
        addButtonConstraints()
        addUpperSliderConstraints()
        addLowerSliderConstraints()
        addUpperLabelsConstraints()
        addLowerLabelsConstraints()
    }
    
    private func addTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
    }
    
    private func addIconImageConstraints() {
        mainViewIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainViewIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainViewIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            mainViewIcon.heightAnchor.constraint(equalToConstant: 200),
            mainViewIcon.widthAnchor.constraint(equalToConstant: 200)
        ])
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
