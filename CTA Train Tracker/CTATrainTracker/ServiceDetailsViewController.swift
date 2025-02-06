import UIKit

class ServiceDetailsViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!

    var serviceDescription: String?
    var stationName: String?
    var route: String?
    var direction: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Populate the text view with service details
        var details = ""
        if let serviceDescription = serviceDescription {
            details += "Service: \(serviceDescription)\n"
        }
        if let stationName = stationName {
            details += "Station: \(stationName)\n"
        }
        if let route = route {
            details += "Route: \(route)\n"
        }
        if let direction = direction {
            details += "Direction: \(direction)\n"
        }
        textView.text = details
    }
}

