//
//  ViewController.swift
//  BMICalculator
//
//  Created by Łukasz Skopiński on 14/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a UIImageView and set its properties
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = SharedAsset.background.image
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // add the UIImageView to the view controller's view
        self.view.addSubview(backgroundImage)
    }
}
