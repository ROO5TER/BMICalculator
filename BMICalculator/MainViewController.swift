//
//  ViewController.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 14/04/2023.
//

import UIKit

class MainViewController: UIViewController {
    private let bmiService = BMIService()
    private let scrollView = UIScrollView()
    private let backgroundImage = UIImageView()
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
        setupScrollView()
        setupBackground()
        setupTitleLabel()
        setupMainIcon()
    }
    
    private func setupScrollView() {
        scrollView.contentSize = CGSize(
            width: scrollView.bounds.width,
            height: 850
        )
        scrollView.isScrollEnabled = true
    }
    
    private func setupBackground() {
        backgroundImage.image = SharedAsset.background.image
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.frame = CGRect(
            x: 0,
            y: 0,
            width: UIScreen.main.bounds.width,
            height: -100
        )
        backgroundImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupTitleLabel() {
        titleLabel.text = Localizable.MainViewController.titleLabelText
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 32, weight: .bold)
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
        view.addSubview(scrollView)
        scrollView.addSubview(backgroundImage)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(mainViewIcon)
        scrollView.addSubview(button)
        scrollView.addSubview(upperSlider)
        scrollView.addSubview(lowerSlider)
        scrollView.addSubview(upperSliderLabels)
        scrollView.addSubview(lowerSliderLabels)
        
    }
    
    private func addConstraints() {
        addScrollViewConstraints()
        addTitleLabelConstraints()
        addIconImageConstraints()
        addUpperLabelsConstraints()
        addUpperSliderConstraints()
        addLowerLabelsConstraints()
        addLowerSliderConstraints()
        addButtonConstraints()
    }
    
    private func addScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor ),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func addBackgroundImageConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            backgroundImage.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            backgroundImage.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    private func addTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50)
        ])
    }
    
    private func addIconImageConstraints() {
        mainViewIcon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainViewIcon.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            mainViewIcon.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            mainViewIcon.heightAnchor.constraint(equalToConstant: 200),
            mainViewIcon.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func addUpperLabelsConstraints() {
        upperSliderLabels.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperSliderLabels.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            upperSliderLabels.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            upperSliderLabels.topAnchor.constraint(equalTo: mainViewIcon.bottomAnchor, constant: 100)
        ])
    }
    
    private func addUpperSliderConstraints() {
        upperSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upperSlider.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            upperSlider.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            upperSlider.topAnchor.constraint(equalTo: upperSliderLabels.bottomAnchor, constant: 15)
        ])
    }
    
    private func addLowerLabelsConstraints() {
        lowerSliderLabels.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowerSliderLabels.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            lowerSliderLabels.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            lowerSliderLabels.topAnchor.constraint(equalTo: upperSlider.bottomAnchor, constant: 40)
        ])
    }
    
    private func addLowerSliderConstraints() {
        lowerSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowerSlider.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            lowerSlider.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            lowerSlider.topAnchor.constraint(equalTo: lowerSliderLabels.bottomAnchor, constant: 15)
        ])
    }
    
    private func addButtonConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            button.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),
            button.topAnchor.constraint(equalTo: lowerSlider.bottomAnchor, constant: 125),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
