//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 08/05/2023.
//

import UIKit

class ResultViewController: UIViewController {
    private let result: WeightClassification
    private let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
    private let titleLabel = UILabel()
    private let resultLabel = UILabel()
    private let resultImage = UIImageView()
    private let adviceLabel = UILabel()
    private let button: BMIButton = .init()
    
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
        setupBackground()
        setupTitleLabel()
        setupResultLabel()
        setupResultImage()
        setupAdviceLabel()
    }
    
    private func hideBackButtonItem() {
        navigationItem.hidesBackButton = true
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
        titleLabel.font = .systemFont(ofSize: 50, weight: .bold)
        titleLabel.addShadow(color: .purple)
    }
    
    private func setupResultLabel() {
        resultLabel.text = result.stringValue
        resultLabel.textColor = result.color
        resultLabel.textAlignment = .center
        resultLabel.font = .systemFont(ofSize: 50, weight: .bold)
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
        adviceLabel.font = .systemFont(ofSize: 22, weight: .regular)
        adviceLabel.numberOfLines = .max
        adviceLabel.addShadow(color: .purple)
    }
    
    private func addSubviews() {
        self.view.addSubview(backgroundImage)
        self.view.addSubview(titleLabel)
        self.view.addSubview(resultLabel)
        self.view.addSubview(resultImage)
        self.view.addSubview(adviceLabel)
        self.view.addSubview(button)
    }
    
    private func addConstraints() {
        addTitleLabelConstraints()
        addResultLabelConstraints()
        addResultImageConstraints()
        addAdviceLabelConstraints()
        addButtonConstraints()
    }
    
    private func addTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        ])
    }
    
    private func addResultLabelConstraints() {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
        ])
    }
    
    private func addResultImageConstraints() {
        resultImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resultImage.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            resultImage.heightAnchor.constraint(equalToConstant: 100),
            resultImage.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func addAdviceLabelConstraints() {
        adviceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            adviceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            adviceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            adviceLabel.topAnchor.constraint(equalTo: resultImage.bottomAnchor, constant: 20)
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
}
