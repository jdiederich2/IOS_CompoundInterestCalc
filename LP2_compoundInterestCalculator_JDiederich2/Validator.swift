//
//  Validator.swift
//  LP2_compoundInterestCalculator_JDiederich2
//
//  Created by Jennifer Diederich on 11/16/17.
//  Copyright © 2017 assignment3 Jennifer Diederich. All rights reserved.
//

import UIKit

class Validator: NSObject {
    
    func isEmptyField(_ textValue: String) -> Bool {
        
        if(textValue.isEmpty) {
            return true
        }
        return false
    }
    
    
    func checkInteger(_ integerString: String) -> Int {
        
        let intString = Int(integerString)
        
        if(intString! < 0 || intString == nil ) {
            return 0
        }
        return intString!
    }
    
    
//    func checkDecimalNumber(_ numberString: String) -> Double {
//
//        let numString = NumberFormatter().number(from: numberString)?.doubleValue
//
//        if(numString == nil || numString! < 0) {
//            return 0.0
//        }
//
//        return numString!
//    }
    
    func checkDecimalNumber(_ numberString: String) -> Double {

        let numString = Double(numberString)

        if(numString == nil || numString! < 0) {
            return 0.0
        }

        return numString!
    }

}
