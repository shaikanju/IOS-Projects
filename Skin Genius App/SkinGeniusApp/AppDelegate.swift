import UIKit
import LocalAuthentication

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Apply the current theme
        ThemeManager.shared.applyCurrentTheme(window: window)
        
        // Check and perform Face ID authentication
        if KeychainHelper.shared.get(forKey: "shouldUseFaceID") == true {
            authenticateUser()
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // Face ID Authentication
    func authenticateUser() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Authenticate to access the app"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // User authenticated successfully
                        // Continue with app launch
                    } else {
                        // User did not authenticate successfully
                        // Handle authentication failure (e.g., show an alert)
                        self.showAuthenticationFailedAlert()
                    }
                }
            }
        } else {
            // Face ID not available
            // Handle the case where Face ID is not available (e.g., show an alert)
            showFaceIDNotAvailableAlert()
        }
    }

    func showAuthenticationFailedAlert() {
        let alert = UIAlertController(title: "Authentication Failed", message: "You could not be authenticated. Please try again.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func showFaceIDNotAvailableAlert() {
        let alert = UIAlertController(title: "Face ID Not Available", message: "Your device does not support Face ID.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

