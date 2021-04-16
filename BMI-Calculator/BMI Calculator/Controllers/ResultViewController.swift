//
//  ResultViewController.swift
//  BMI Calculator

import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeBmiValue = bmiValue {
            resultLabel.text = safeBmiValue
            adviceLabel.text = advice
            background.backgroundColor = color;
        }
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        // pops the current controller from stack
        self.dismiss(animated: true, completion:nil)
    }
}
