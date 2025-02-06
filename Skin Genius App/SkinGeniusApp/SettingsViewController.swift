import UIKit
import LocalAuthentication


class SettingsViewController: UIViewController {
    @IBOutlet weak var themeSwitch: UISwitch!
    @IBOutlet weak var faceIDSwitch: UISwitch!
    
    
    
    @IBOutlet weak var termsLabel: UILabel!
    
    override func viewDidLoad() {        super.viewDidLoad()

        // Set the switch state based on the saved theme preference
        let isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
        themeSwitch.isOn = isDarkModeEnabled
        
        ThemeManager.shared.applyCurrentTheme(view: self.view)
        // Set the selected segment based on the current language
        let isFaceIDEnabled = KeychainHelper.shared.get(forKey: "shouldUseFaceID") ?? false
               faceIDSwitch.isOn = isFaceIDEnabled
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(termsLabelTapped))
               termsLabel.isUserInteractionEnabled = true
               termsLabel.addGestureRecognizer(tapGesture)
        
        
    }
    @objc func termsLabelTapped() {
           // Perform the segue to TermsViewController
           performSegue(withIdentifier: "showTermsSegue", sender: self)
       }
        
    @IBAction func themeSwitchValueChanged(_ sender: UISwitch) {
        // Toggle and apply the theme
        ThemeManager.shared.toggleTheme(window: view.window)
        
        // Notify all view controllers about the theme change
        NotificationCenter.default.post(name: Notification.Name("ThemeChanged"), object: nil)
        ThemeManager.shared.applyCurrentTheme(view: self.view)
    }
    
    @IBAction func faceIDSwitchValueChanged(_ sender: UISwitch) {
           // Toggle Face ID setting in UserDefaults
        KeychainHelper.shared.set(sender.isOn, forKey: "shouldUseFaceID")

                if sender.isOn {
                    // Prompt for Face ID authentication to enable it
                    let context = LAContext()
                    var error: NSError?

                    if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                        let reason = "Enable Face ID"

                        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                            DispatchQueue.main.async {
                                if success {
                                    // Successfully enabled Face ID
                                    let alert = UIAlertController(title: "Face ID Enabled", message: "Face ID has been enabled for authentication.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                                    self.present(alert, animated: true)
                                } else {
                                    // Failed to authenticate, revert the switch
                                    self.faceIDSwitch.isOn = false
                                    KeychainHelper.shared.set(false, forKey: "shouldUseFaceID")
                                    let alert = UIAlertController(title: "Authentication Failed", message: "Face ID could not be enabled. Please try again.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                                    self.present(alert, animated: true)
                                }
                            }
                        }
                    } else {
                        // Face ID not available
                        self.faceIDSwitch.isOn = false
                        let alert = UIAlertController(title: "Face ID not available", message: "Your device does not support Face ID.", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default))
                        self.present(alert, animated: true)
                    }
                }
            }
        }
