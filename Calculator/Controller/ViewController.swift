//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    private var displayValue: Double {
        
        get {
            guard let text = displayLabel.text, let number = Double(text) else {
                fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculotor = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculotor.setNumber(displayValue)
        
        guard let calcMethod = sender.currentTitle, let result = calculotor.calculate(symbol: calcMethod) else { return }
        
        displayValue = result
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
                
            } else {
                
                if numValue == "." {
                    
                    let isInt = floor (displayValue) == displayValue
                    
                    if !isInt { return }
                }
                guard let text = displayLabel.text else { return }
                displayLabel.text = text + numValue
            }
        }
    }
}
