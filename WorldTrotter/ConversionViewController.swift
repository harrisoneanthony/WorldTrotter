//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Harrison Anthony on 6/13/23.
//

import UIKit

class ConversionViewController: UIViewController {

    @IBOutlet weak var lblFahrenheit: UILabel!
    @IBOutlet weak var lblCelsius: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
        self.lblFahrenheit.text = "100"
        self.lblCelsius.text = "60"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        }


}

