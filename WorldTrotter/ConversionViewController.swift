//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Harrison Anthony on 6/13/23.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtFahrenheit: UITextField!
    @IBOutlet weak var lblCelsius: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
        self.txtFahrenheit.text = ""
        self.txtFahrenheit.delegate = self
        self.lblCelsius.text = "60"
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    // functions for fahrenheit and celcius txt
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        if let text = textField.text, !text.isEmpty {
            lblCelsius.text = text
        } else {
            lblCelsius.text = "???"
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.lblCelsius.text = textField.text
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    // function for dismissing keyboard on return
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    
}

