//
//  ViewController.swift
//  HW4
//
//  Created by Rohan Panchal on 1/29/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyTv: UILabel!
    
    
    @IBOutlet weak var tvPower: UILabel!
    
    @IBOutlet weak var speakervol: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var label3: UILabel!
    
    @IBOutlet weak var switchpower: UISwitch!
    
    @IBOutlet weak var volumeslider: UISlider!
    
    @IBOutlet weak var segmentcontroller: UISegmentedControl!
    
    
    @IBOutlet weak var button0: UIButton!
    
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button9: UIButton!
    
    @IBOutlet weak var button8: UIButton!
    
    
    @IBOutlet weak var chnegative: UIButton!
    
    @IBOutlet weak var chpositive: UIButton!
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var Channelnumber: UILabel!
    private var currentVariable: Int = 50
    
    
    
        override func viewDidLoad() {        super.viewDidLoad()
            label2.text = "\(Int(volumeslider.value))"
            switchpower.isOn = false  // Power button off
                label1.text = "off"
        segmentcontroller.accessibilityIdentifier = "Favorite_Channel_Segmented_Control"
        // Do any additional setup after loading the view.
        
               volumeslider.isEnabled = false  // Volume slider disabled
               //segmentcontroller.isEnabled = false  // Segmented control disabled
            for index in 0..<4 {
                segmentcontroller.setEnabled(false, forSegmentAt: index)
                }
            disableNumberButtons()
            label3.text="50"
               // Set label1 text and accessibility identifier
           
       
    }
    
    
    @IBAction func numberButtonTapped(_ sender: UIButton) {
            //let number = sender.tag
            // Handle the number input
            //handleNumberInput(number)
        guard let digit = sender.titleLabel?.text else {
                return
            }

            if label3.text?.count == 2 {
                // If label3 has two digits, clear it before appending the new digit
                label3.text = digit
            } else {
                // If label3 has less than two digits, append the new digit
                label3.text = (label3.text ?? "") + digit
            }
        if let newNumber = Int(label3.text ?? ""), label3.text?.count == 2, newNumber >= 0 && newNumber <= 99 {
            currentVariable = newNumber
        }
        
        }
    @IBAction func chPositiveButtonTapped(_ sender: UIButton) {
            // Handle CH+ button tap
            handleCHPositiveButtonTap()
        }
    @IBAction func chNegativeButtonTapped(_ sender: UIButton) {
            // Handle CH- button tap
            handleCHNegativeButtonTap()
        }
    private func handleNumberInput(_ number: Int) {
            // Check if currentVariable is a two-digit number
            if currentVariable < 10 {
                // If it's a single-digit number, update it with the new number
                currentVariable = number
            } else {
                // If it's a two-digit number, update the tens and units places
                currentVariable = (currentVariable % 10) * 10 + number
            }

            // Update label3.text
            label3.text = String(format: "%02d", currentVariable)
        }
    private func handleCHPositiveButtonTap() {
            // Increment currentVariable and handle wrapping around
            currentVariable = (currentVariable + 1) % 100
        if currentVariable == 0 {
                currentVariable = 1
            }
            // Update label3.text
            label3.text = String(format: "%02d", currentVariable)
        }

        // Helper function to handle CH- button tap
        private func handleCHNegativeButtonTap() {
            // Decrement currentVariable and handle wrapping around
            currentVariable = (currentVariable - 1 + 100) % 100
            if currentVariable == 0 {
                    currentVariable = 99
                }
            // Update label3.text
            label3.text = String(format: "%02d", currentVariable)
        }

    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
           updateLabel3ForSelectedSegment()
       }

       private func updateLabel3ForSelectedSegment() {
           guard segmentcontroller.isEnabled else {
               return
           }

           let selectedSegmentIndex = segmentcontroller.selectedSegmentIndex

           switch selectedSegmentIndex {
           case 0:
               label3.text = "22"
           case 1:
               label3.text = "33"
           case 2:
               label3.text = "44"
           case 3:
               label3.text = "55"
           default:
               break
           }
       }
   
    @IBAction func togglePower(_ sender: Any) {
        // Toggle label1 state
        
        print("Toggle Power Method Called")
        // Toggle powerSwitch state
        switchpower.setOn(switchpower.isOn, animated: true)
        print("Toggle Power Method Called - After Toggle")
        label1.text = (switchpower.isOn ? "on" : "off")
        volumeslider.isEnabled = switchpower.isOn
        for index in 0..<segmentcontroller.numberOfSegments {
            segmentcontroller.setEnabled(switchpower.isOn, forSegmentAt: index)
            }
        updateUIForPowerState()
    }
    private func updateUIForPowerState() {
        // Enable or disable number buttons based on the power switch state
        if switchpower.isOn {
            enableNumberButtons()
        } else {
            disableNumberButtons()
        }
    }
    private func disableNumberButtons() {
        // Disable all number buttons
        button0.isEnabled = false
        button1.isEnabled = false
            button2.isEnabled = false
            button3.isEnabled = false
            button4.isEnabled = false
            button5.isEnabled = false
            button6.isEnabled = false
            button7.isEnabled = false
            button8.isEnabled = false
            button9.isEnabled = false
        chpositive.isEnabled = false
           chnegative.isEnabled = false
        // ... similarly for button2 to button9
    }
    private func enableNumberButtons() {
        // Enable all number buttons
        button0.isEnabled = true
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            button4.isEnabled = true
            button5.isEnabled = true
            button6.isEnabled = true
            button7.isEnabled = true
            button8.isEnabled = true
            button9.isEnabled = true

            // Enable channel buttons
            chpositive.isEnabled = true
            chnegative.isEnabled = true    }
    @IBAction func sliderMoved(_ sender: UISlider) {
        label2.text = "\(Int(sender.value))"
    }


}

