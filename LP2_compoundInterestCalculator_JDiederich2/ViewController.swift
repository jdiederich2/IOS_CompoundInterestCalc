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
        
        calculateCompoundInterest()
    }
    
    
    func validateUserInput() {
        let userInfo = Validator()

        if (userInfo.isEmptyField(principalTextField.text!)) {
            resultsTextView.text = "Please enter a numeric value for your Principle amount."
            
        } else {
            
            if (userInfo.checkDecimalNumber(principalTextField.text!) == 0.0) {
                
                resultsTextView.text = principalTextField.text! + " is not a number! Please enter a numeric value for your Principle amount."
                
                principalTextField.text = ""
                
            } else {
                
                principalAmount = Double(principalTextField.text!)!
                
                if (userInfo.isEmptyField(rateTextField.text!)) {
                    resultsTextView.text = "Please enter a numeric value for your Interest Rate."
                    
                } else {
                    
                    if (userInfo.checkDecimalNumber(rateTextField.text!) == 0.0) {
                        
                        resultsTextView.text = rateTextField.text! + " is not a number! Please enter a numeric value for your Interest amount."
                        
                        rateTextField.text = ""
                        
                    } else {
                        
                        interestRatePct = Double(rateTextField.text!)!
                        
                        if (userInfo.isEmptyField(numYearsTextField.text!)) {
                            resultsTextView.text = "Please enter a numeric value for Number of Years."
                            
                        } else {
                            
                            if (userInfo.checkInteger(numYearsTextField.text!) == 0) {
                                resultsTextView.text = numYearsTextField.text! + " is not a number! Please enter a numeric value for your Number of Years."
                                
                                numYearsTextField.text = ""
                                
                            } else {
                                
                                numberOfYears = Int(numYearsTextField.text!)!
                                
                                if (userInfo.isEmptyField(timesPerYearTextField.text!)) {
                                    resultsTextView.text = "Please enter a numeric value for Times per Year."
                                    
                                } else {
                                    
                                    if (userInfo.checkInteger(timesPerYearTextField.text!) == 0) {
                                        resultsTextView.text = timesPerYearTextField.text! + " is not a number! Please enter a numeric value for your Times per Year."
                                        
                                        timesPerYearTextField.text = ""
                                        
                                    } else {
                                        
                                        timesPerYear = Int(timesPerYearTextField.text!)!
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    

        
    func calculateCompoundInterest() {
        
        let calcInterest = CompoundInteresthelper()
        
        resultValue = calcInterest.compoundInterest(principalAmount, interestRatePct, numberOfYears, timesPerYear)

        resultsTextView.text = "\(currencyFormater(principalAmount)) invested at \(interestRatePct)% for \(numberOfYears) years compounded \(timesPerYear) times per year is \(currencyFormater(resultValue))."
        
    }
    
    func currencyFormater(_ decimalNumber: Double) -> String {
        let currentLocale = Locale.current
        let currencySymbol = currentLocale.currencySymbol
        
        let formattedNumber = "\(currencySymbol ?? "$")\(String(format: "%.2f", decimalNumber as CVarArg))"
        
        return formattedNumber
    }

            
    //
    //    userInfo.isEmptyField(self.numYearsTextField.text!)
     //   userInfo.isEmptyField(self.timesPerYearTextField.text!)

     //   userInfo.checkInteger(self.numYearsTextField.text!)
    //    userInfo.checkInteger(self.timesPerYearTextField.text!)
        
      //
     //   userInfo.checkDecimalNumber(self.rateTextField.text!)
    
    
}

