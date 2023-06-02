//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 08/05/2023.
//

import UIKit

class ResultViewController: UIViewController {
    private let result: WeightClassification
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    private let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    private let topSpacerLabel = UILabel()
    private let titleLabel = UILabel()
    private let resultLabel = UILabel()
    private let resultImage = UIImageView()
    private let adviceLabel = UILabel()
    private let button: BMIButton = .init()
    private let bottomSpacerLabel = UILabel()
    private let screenWidth = UIScreen.main.bounds.width
    
    init(result: WeightClassification) {
        self.result = result
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyling()
        configure()
        addSubviews()
        addConstraints()
    }
    
    @objc func buttonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func configure() {
        button.configure(viewModel: .init(
            title: Localizable.ResultViewController.buttonTitle,
            action:( #selector(buttonTapped))
        ))
    }
    
    private func setupStyling() {
        hideBackButtonItem()
        setupScrollView()
        setupStackView()
        setupBackground()
        setupTitleLabel()
        setupResultLabel()
        setupResultImage()
        setupAdviceLabel()
    }
    
    private func hideBackButtonItem() {
        navigationItem.hidesBackButton = true
    }
    
    private func setupScrollView() {
        scrollView.isScrollEnabled = true
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
    }
    
    private func setupBackground() {
        backgroundImage.image = SharedAsset.background.image
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupTitleLabel() {
        titleLabel.text = Localizable.ResultViewController.tittleLabel
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 55, weight: .bold)
        titleLabel.addShadow(color: .purple)
    }
    
    private func setupResultLabel() {
        resultLabel.text = result.stringValue
        resultLabel.textColor = result.color
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 55, weight: .bold)
        resultLabel.addShadow(color: .purple)
    }
    
    private func setupResultImage() {
        resultImage.image = result.image
        resultImage.tintColor = result.color
        resultImage.contentMode = .scaleAspectFit
        resultImage.addShadow(color: .white)
    }
    
    private func setupAdviceLabel() {
        adviceLabel.text = result.advice
        adviceLabel.textColor = .white
        adviceLabel.textAlignment = .center
        adviceLabel.font = .systemFont(ofSize: 24, weight: .regular)
        adviceLabel.numberOfLines = .max
        adviceLabel.addShadow(color: .purple)
    }
    
    private func addSubviews() {
        view.addSubview(backgroundImage)
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(topSpacerLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(resultLabel)
        stackView.addArrangedSubview(resultImage)
        stackView.addArrangedSubview(adviceLabel)
        stackView.addArrangedSubview(button)
        stackView.addArrangedSubview(bottomSpacerLabel)
    }
    
    private func addConstraints() {
        addScrollViewConstraints()
        addStackViewConstraints()
        addBackgroundImageConstraints()
        addTopSpacerLabelConstraints()
        addTitleLabelConstraints()
        addResultLabelConstraints()
        addResultImageConstraints()
        addAdviceLabelConstraints()
        addButtonConstraints()
        addBottomSpacerLabelConstraints()
    }
    
    private func addScrollViewConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func addStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: screenWidth),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func addBackgroundImageConstraints() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImage.widthAnchor.constraint(equalToConstant: screenWidth),
            backgroundImage.topAnchor.constraint(equalTo: stackView.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
    }
    
    private func addTopSpacerLabelConstraints() {
        topSpacerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topSpacerLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func addTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func addResultLabelConstraints() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    private func addResultImageConstraints() {
        stackView.setCustomSpacing(60, after: resultImage)
        resultImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultImage.widthAnchor.constraint(equalToConstant: 250),
            resultImage.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func addAdviceLabelConstraints() {
        adviceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            adviceLabel.widthAnchor.constraint(equalToConstant: screenWidth - 60),
            adviceLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 150)
        ])
    }
    
    private func addButtonConstraints() {
        stackView.setCustomSpacing(60, after: adviceLabel)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: screenWidth - 60),
            button.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func addBottomSpacerLabelConstraints() {
        bottomSpacerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bottomSpacerLabel.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
}
