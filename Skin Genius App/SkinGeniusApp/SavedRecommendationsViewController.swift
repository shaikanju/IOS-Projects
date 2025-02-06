import UIKit

class SavedRecommendationsViewController: UIViewController {

    @IBOutlet weak var recommendationsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSavedRecommendations()
    }
    
    func loadSavedRecommendations() {
        if let savedRecommendations = UserDefaults.standard.string(forKey: "SavedRecommendations") {
            recommendationsTextView.text = savedRecommendations
        } else {
            recommendationsTextView.text = "No recommendations available."
        }
    }
}

