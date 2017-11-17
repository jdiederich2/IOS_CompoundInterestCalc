//
//  CompoundInteresthelper.swift
//  LP2_compoundInterestCalculator_JDiederich2
//
//  Created by Jennifer Diederich on 11/17/17.
//  Copyright © 2017 assignment3 Jennifer Diederich. All rights reserved.
//

import UIKit

class CompoundInteresthelper: NSObject {

    func compoundInterest(_ principal: Double, _ ratePct: Double, _ numberOfYears: Int, _ timesPerYear: Int) -> Double {
        
        // Result = P(1 + r/n)nt
        let interestRatePct: Double = ratePct / 100.0
        print(interestRatePct)
        
        let divResult: Double = interestRatePct / Double(timesPerYear)
        print(divResult)
        
        let sumResult: Double = divResult + 1
        print(sumResult)
        
        let powerValue: Int = numberOfYears * timesPerYear
        print(powerValue)
        
        let amountToMultiplyBy = pow(Double(sumResult), Double(powerValue))
        print(amountToMultiplyBy)
        
        return (principal * Double(amountToMultiplyBy))
        
    }
}
