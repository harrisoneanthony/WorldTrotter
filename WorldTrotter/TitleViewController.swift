//
//  TitleViewController.swift
//  WorldTrotter
//
//  Created by Harrison Anthony on 6/15/23.
//

import UIKit

class TitleViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
                
                // Generate random RGB values
                let red = CGFloat.random(in: 0...1)
                let green = CGFloat.random(in: 0...1)
                let blue = CGFloat.random(in: 0...1)
                
                // Create a random color
                let randomColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
                
                // Set the background color of the view
                view.backgroundColor = randomColor
        
    }
}
