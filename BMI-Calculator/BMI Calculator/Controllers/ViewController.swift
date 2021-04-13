//
//  ViewController.swift
//  BMI Calculator
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    	
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var bmiValue = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightValueChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + "m"// round
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.0f", sender.value) + "kg"// round
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        let bmi = weight / (height * height)
        self.bmiValue = String(format: "%.2f", bmi)
        
        // prepare the segue for transition
        self.performSegue(withIdentifier: K.Segues.goToResult, sender: self)
        let resultViewController = ResultViewController()
        resultViewController.bmiValue = String(format: "%.2f", bmi)
        self.present(resultViewController, animated: true, completion: nil)
    }
    
    // make necessary initilization for next controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.goToResult {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = self.bmiValue
        }
    }
}

