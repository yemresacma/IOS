//
//  ResultViewController.swift
//  BMI Calculator

import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String?
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var advıceLabel: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let safeBmiValue = bmiValue {
            resultLabel.text = safeBmiValue
        }
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        // pops the current controller from stack
        self.dismiss(animated: true, completion:nil)
    }
}
