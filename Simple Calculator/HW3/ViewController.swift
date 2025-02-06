//
//  ViewController.swift
//  HW3
//
//  Created by Rohan Panchal on 1/22/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    var currentOperand: String = ""
        
    var initialsum: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        resultLabel.text="0"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        guard let digit = sender.titleLabel?.text else { return }
        appendDigitToOperand(digit)
        
        
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        clearResultLabel()
        clearSum()
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        addInputToSum()

    }
    
    @IBAction func equalsButtonTapped(_ sender: UIButton) {
        computeSum()
    }
    
    func appendDigitToOperand(_ digit: String) {
                    currentOperand += digit
        
        updateResultLabel()
    }
    
    func clearResultLabel() {
        currentOperand = ""
        resultLabel.text="0"    }
    
    func clearSum() {
        
        initialsum = 0
    }
    
    func addInputToSum() {
        guard let operand = Int(currentOperand) else { return }
        initialsum += operand
                currentOperand = "0" // Reset the current operand for the next input
        
        updateResultLabel()
    }

   
    func computeSum() {
        guard let operand = Int(currentOperand) else { return }
        initialsum += operand
        
        resultLabel.text=String(initialsum)

        
    }
    
    
    
    func updateResultLabel() {
        resultLabel.text = currentOperand
    }
    
}



