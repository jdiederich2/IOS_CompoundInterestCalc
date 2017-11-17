//
//  ViewController.swift
//  LP2_compoundInterestCalculator_JDiederich2
//
//  Created by Jennifer Diederich on 11/16/17.
//  Copyright © 2017 assignment3 Jennifer Diederich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var principalTextField: UITextField!
    @IBOutlet weak var rateTextField: UITextField!
    @IBOutlet weak var numYearsTextField: UITextField!
    @IBOutlet weak var timesPerYearTextField: UITextField!
    @IBOutlet weak var calcInterestButton: UIButton!
    @IBOutlet weak var resultsTextView: UITextView!
    
    var principalAmount = 0.0
    var interestRatePct = 0.0
    var resultValue = 0.0
    var numberOfYears = 0
    var timesPerYear = 0
    var showResult = false
    var outputString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        principalTextField.becomeFirstResponder()
        
        calcInterestButton.layer.cornerRadius = 7
        calcInterestButton.layer.borderColor = UIColor.blue.cgColor
        calcInterestButton.layer.borderWidth = 1
        
        resultsTextView.layer.cornerRadius = 3
        resultsTextView.layer.borderColor = UIColor.gray.cgColor
        resultsTextView.layer.borderWidth = 1
        
    }

    @IBAction func calcInterestButton(_ sender: UIButton) {
        validateUserInput()
    }
    
    
    func validateUserInput() {
        let userInfo = Validator()

        if (userInfo.isEmptyField(self.principalTextField.text!)) {
            resultsTextView.text = "Please enter a numeric value for your Principle amount"
            
        } else {
            
            if (userInfo.checkDecimalNumber(self.principalTextField.text!) == 0.0) {
                
                resultsTextView.text = self.principalTextField.text! + " is not a number! Please enter a numeric value for your Principle amount."
                
                self.principalTextField.text = ""
                
            } else {
                
                self.principalAmount = Double(self.principalTextField.text!)!
                
                if (userInfo.isEmptyField(self.rateTextField.text!)) {
                    resultsTextView.text = "Please enter a numeric value for your Interest Rate"
                    
                } else {
                    
                    if (userInfo.checkDecimalNumber(self.rateTextField.text!) == 0.0) {
                        
                        resultsTextView.text = self.rateTextField.text! + " is not a number! Please enter a numeric value for your Interest amount."
                        
                        self.rateTextField.text = ""
                        
                    } else {
                        
                        self.interestRatePct = Double(self.rateTextField.text!)!
                    }
                }
            }
        }
    }

    

        
    func calculateCompoundInterest() {

        resultsTextView.text = "\(principalAmount) invested at "
        
    }

            
    //
    //    userInfo.isEmptyField(self.numYearsTextField.text!)
     //   userInfo.isEmptyField(self.timesPerYearTextField.text!)

     //   userInfo.checkInteger(self.numYearsTextField.text!)
    //    userInfo.checkInteger(self.timesPerYearTextField.text!)
        
      //
     //   userInfo.checkDecimalNumber(self.rateTextField.text!)
    
    
}

