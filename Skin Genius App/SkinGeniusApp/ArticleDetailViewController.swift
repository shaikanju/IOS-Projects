import UIKit

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UITextView! // Connect this outlet to your label or text view in the storyboard
    
    var article: Article? // This property will hold the selected article
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Check if an article is assigned
        if let selectedArticle = article {
            // Display the long description of the article
            descriptionLabel.text = selectedArticle.longDescription
        }
    }
}

