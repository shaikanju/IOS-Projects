import UIKit

protocol TimePickerDelegate: AnyObject {
    func didSelectTimes(morningHour: Int, morningMinute: Int, eveningHour: Int, eveningMinute: Int)
}
class TimePickerViewController: UIViewController {
    @IBOutlet weak var eveningTimePicker: UIDatePicker!
    
    @IBOutlet weak var morningTimePicker: UIDatePicker!
    weak var delegate: TimePickerDelegate?
    var isMorning: Bool = true
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            morningTimePicker.datePickerMode = .time
            eveningTimePicker.datePickerMode = .time
        }

        @IBAction func doneButtonTapped(_ sender: UIButton) {
            let morningComponents = Calendar.current.dateComponents([.hour, .minute], from: morningTimePicker.date)
            let eveningComponents = Calendar.current.dateComponents([.hour, .minute], from: eveningTimePicker.date)
            
            if let morningHour = morningComponents.hour, let morningMinute = morningComponents.minute,
               let eveningHour = eveningComponents.hour, let eveningMinute = eveningComponents.minute {
                delegate?.didSelectTimes(morningHour: morningHour, morningMinute: morningMinute, eveningHour: eveningHour, eveningMinute: eveningMinute)
            }
            dismiss(animated: true, completion: nil)
        }
    }


