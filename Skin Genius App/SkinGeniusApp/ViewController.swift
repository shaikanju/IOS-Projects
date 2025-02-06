//
//  ViewController.swift
//  SkinGeniusApp
//
//  Created by CDMStudent on 5/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var widget: UILabel!
    
    @IBOutlet weak var recommendations: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet var labels: [UILabel]!

    @IBOutlet weak var analysis: UIImageView!
    
    @IBOutlet weak var settings: UIImageView!
    
    @IBOutlet weak var tips: UIImageView!
    
    var isDarkModeEnabled = false
    
    override func viewDidLoad() {
            super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
                widget.isUserInteractionEnabled = true
                widget.addGestureRecognizer(tapGesture)
        let recommendationsTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(recommendationsTapped))
              recommendations.addGestureRecognizer(recommendationsTapGestureRecognizer)
              recommendations.isUserInteractionEnabled = true
        
        let analysisTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(analysisTapped))
               analysis.addGestureRecognizer(analysisTapGestureRecognizer)
               analysis.isUserInteractionEnabled = true
            // Adding tap gesture to the imageView
            let imageTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
            imageView.addGestureRecognizer(imageTapGestureRecognizer)
            imageView.isUserInteractionEnabled = true  // Ensure user interaction is enabled

            // Adding tap gesture to the tips image view
            let tipsTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tipsImageTapped))
            tips.addGestureRecognizer(tipsTapGestureRecognizer)
            tips.isUserInteractionEnabled = true  // Ensure user interaction is enabled
        
        
        let settingsTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(settingsTapped))
                settings.addGestureRecognizer(settingsTapGestureRecognizer)
                settings.isUserInteractionEnabled = true 
        NotificationCenter.default.addObserver(self, selector: #selector(applyTheme), name: Notification.Name("ThemeChanged"), object: nil)
              
              // Apply the current theme
              applyTheme()// Ensure user interaction is enabled
        }
    @objc func recommendationsTapped() {
            performSegue(withIdentifier: "showSavedRecommendations", sender: self)
        }
    @objc func labelTapped() {
            // Perform the segue when the label is tapped
            performSegue(withIdentifier: "showwidget", sender: nil)
        }
        
        
    
//    @objc func recommendationsTapped() {
//        if let savedRecommendations = UserDefaults.standard.string(forKey: "SavedRecommendations") {
//            // Perform segue to the results view controller
//            performSegue(withIdentifier: "showrec", sender: savedRecommendations)
//        } else {
//            print("No saved recommendations found.")
//        }
//    }

    @objc func applyTheme() {
            let isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
            view.backgroundColor = isDarkModeEnabled ? .black : .white
            
            // Update label colors in the current view controller
            for label in labels {
                label.textColor = isDarkModeEnabled ? .white : .black
            }
        settings.tintColor = isDarkModeEnabled ? .white : .black
        }
    deinit {
           // Remove observer
           NotificationCenter.default.removeObserver(self, name: Notification.Name("ThemeChanged"), object: nil)
       }
    @objc func settingsTapped() {
           // Perform segue to the settings view controller
           performSegue(withIdentifier: "showsettings", sender: self)
       }

        @objc func imageTapped() {
            // Perform segue or navigation
            performSegue(withIdentifier: "showSecondViewController", sender: self)
        }
    @objc func analysisTapped() {
            // Perform segue to the questions view controller
            performSegue(withIdentifier: "showquestions", sender: self)
        }

        @objc func tipsImageTapped() {
            // Perform segue or navigation to the tips & articles screen
            performSegue(withIdentifier: "showtips", sender: self)
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "showSecondViewController" {
                // Perform any setup needed for the second view controller
            } else if segue.identifier == "showtips" {
                // Perform any setup needed for the Tips_Articles view controller
            }
            else if segue.identifier == "showsettings" {
                        // Perform any setup needed for the SettingsViewController
                    }
            else if segue.identifier == "showquestions"{
                
            }
            else if segue.identifier == "showSavedRecommendations" {
                
            }
            

        }
    
    

    
    }
