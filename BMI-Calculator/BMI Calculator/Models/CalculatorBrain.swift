//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by YUNUS EMRE SAÇMA on 16.04.2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    var bmi: BMI?

    mutating func calculateBMI(_ height: Float, _ weight: Float) {
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value : bmiValue, advice: "Eat more", color: UIColor.blue)
        } else if bmiValue < 25 {
            bmi = BMI(value : bmiValue, advice: "You are on fire", color: UIColor.green)
        } else {
            bmi = BMI(value : bmiValue, advice: "Eat less", color: UIColor.red)
        }
    }
    
    func getBMIValue() -> String {
        let bmiValue = bmi?.value ?? 0.0
        return String(format : "%.1f", bmiValue)
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
  
