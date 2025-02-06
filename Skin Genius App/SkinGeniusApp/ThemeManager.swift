import UIKit

class ThemeManager {
    static let shared = ThemeManager()

    private init() {}
    func applyCurrentTheme(window: UIWindow?) {
            let isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
            if isDarkModeEnabled {
                window?.overrideUserInterfaceStyle = .dark
            } else {
                window?.overrideUserInterfaceStyle = .light
            }
        }
        
        func applyCurrentTheme(view: UIView) {
            let isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
            if isDarkModeEnabled {
                view.overrideUserInterfaceStyle = .dark
            } else {
                view.overrideUserInterfaceStyle = .light
            }
        }
        
        func toggleTheme(window: UIWindow?) {
            let isDarkModeEnabled = !UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
            UserDefaults.standard.set(isDarkModeEnabled, forKey: "isDarkModeEnabled")
            applyCurrentTheme(window: window)
        }
        
        func toggleTheme(view: UIView) {
            let isDarkModeEnabled = !UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
            UserDefaults.standard.set(isDarkModeEnabled, forKey: "isDarkModeEnabled")
            applyCurrentTheme(view: view)
        }
    }

//    func applyTheme(isDarkModeEnabled: Bool, window: UIWindow?) {
//        if isDarkModeEnabled {
//            window?.overrideUserInterfaceStyle = .dark
//            window?.backgroundColor = .black
//        } else {
//            window?.overrideUserInterfaceStyle = .light
//            window?.backgroundColor = .white
//        }
//
//        // Change label colors in all view controllers
//        UILabel.appearance().textColor = isDarkModeEnabled ? .white : .black
//    }
//
//    func toggleTheme(window: UIWindow?) {
//        let isDarkModeEnabled = !UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
//        UserDefaults.standard.set(isDarkModeEnabled, forKey: "isDarkModeEnabled")
//        applyTheme(isDarkModeEnabled: isDarkModeEnabled, window: window)
//    }
//
//    func applyCurrentTheme(window: UIWindow?) {
//        let isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
//        applyTheme(isDarkModeEnabled: isDarkModeEnabled, window: window)
//    }
//}

