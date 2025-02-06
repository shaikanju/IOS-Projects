import UIKit

class WidgetViewController: UIViewController {

    @IBOutlet weak var instructionsTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set the text for the instructionsTextView
        instructionsTextView.text = "To add the widget to your home screen, touch and hold an empty area on the home screen until the apps jiggle.\nThen, tap the '+' button in the upper corner.\nSearch for 'Skin Genius App',\nselect a size, and tap 'Add Widget'."

    }
}

