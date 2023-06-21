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
    
    // declaring temp optionals for conversion
    var fahrenheitValue: Measurement<UnitTemperature>? {
        //add property ovserver
        didSet {
            updateCelciusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    // add number formatter as a property
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
        
        //override viewDidLoad() with updateCelsiusLabel to set initial value of celsius to "???"
        updateCelciusLabel()
                
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        
        view.layer.insertSublayer(gradientLayer, at: 0)
        }
    
    // functions for fahrenheit and celcius txt
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
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
    
    //updating celsius label
    func updateCelciusLabel(){
        if let celsiusValue = celsiusValue {
            lblCelsius.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            lblCelsius.text = "???"
        }
    }
    
}

