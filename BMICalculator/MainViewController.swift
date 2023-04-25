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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStyling()
        configure()
        addSubviews()
        addConstraints()
    }
    
    @objc func buttonTapped(sender: UIButton!) {
        // TODO: add calculation logic
    }
    
    private func setupStyling() {
        // create a UIImageView and set its properties
        backgroundImage.image = SharedAsset.background.image
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func configure() {
        //setup button
        button.configure(viewModel: .init(
            title: Localizable.MainViewController.buttonTitle,
            action: #selector(buttonTapped)
        ))
    }
    
    private func addSubviews() {
        // add the UIImageView to the view controller's view
        self.view.addSubview(backgroundImage)
        self.view.addSubview(button)
    }
    
    private func addConstraints() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            button.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: -60),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
