import UIKit
import WidgetKit
import UserNotifications

class CreateRoutine: UIViewController,DatePickerDelegate,TimePickerDelegate{
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var calendarButton: UIImageView!
    
    @IBOutlet weak var mrngbtn1: UIButton!
    @IBOutlet weak var mrngbtn2: UIButton!
    @IBOutlet weak var mrngbtn3: UIButton!
    @IBOutlet weak var evengbtn1: UIButton!
    @IBOutlet weak var evengbtn2: UIButton!
    @IBOutlet weak var evengbtn3: UIButton!
    @IBOutlet weak var exfbtn1: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var NotificationSwitch: UISwitch!
    
    @IBOutlet weak var exfbtn2: UILabel!
    
    @IBOutlet weak var exfimage: UIImageView!
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewDidLoad: CreateRoutine view has loaded.")
        restoreState()
        
        print("ViewDidLoad: CreateRoutine view has loaded.")
        
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if !granted {
                print("Permission Denied")
            }
            if let error = error {
                print("Error requesting notification authorization: \(error.localizedDescription)")
            }
        }
        
        if UserDefaults.standard.object(forKey: "notificationsEnabled") == nil {
            UserDefaults.standard.set(false, forKey: "notificationsEnabled")
        }
        
        NotificationSwitch.isOn = UserDefaults.standard.bool(forKey: "notificationsEnabled")
        
        mrngbtn1.addTarget(self, action: #selector(morningButtonTapped(_:)), for: .touchUpInside)
        mrngbtn2.addTarget(self, action: #selector(morningButtonTapped(_:)), for: .touchUpInside)
        mrngbtn3.addTarget(self, action: #selector(morningButtonTapped(_:)), for: .touchUpInside)
        evengbtn1.addTarget(self, action: #selector(eveningButtonTapped(_:)), for: .touchUpInside)
        evengbtn2.addTarget(self, action: #selector(eveningButtonTapped(_:)), for: .touchUpInside)
        evengbtn3.addTarget(self, action: #selector(eveningButtonTapped(_:)), for: .touchUpInside)
        exfbtn1.addTarget(self, action: #selector(exfoliationButtonTapped(_:)), for: .touchUpInside)
        setInitialViewState()

        // Ensure images are set
        setButtonImages()
        updateDateLabel(date: Date())
        
        // Initial label update
        updateMorningRoutineState()
        updateEveningRoutineState()
        updateExfoliationRoutineState()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(calendarButtonTapped))
                calendarButton.isUserInteractionEnabled = true
                calendarButton.addGestureRecognizer(tapGesture)
    }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        print("ViewWillDisappear: CreateRoutine view is about to disappear.")

            // Save data and state when the screen is closed
            saveState()
        }
    func saveState() {
        print("Saving state...")
            // Save relevant data to UserDefaults or other storage
            UserDefaults.standard.set(label1.text, forKey: "label1Text")
            UserDefaults.standard.set(label2.text, forKey: "label2Text")
            UserDefaults.standard.set(label3.text, forKey: "label3Text")
        UserDefaults.standard.set(label1.text, forKey: "label1Text")
            UserDefaults.standard.set(label2.text, forKey: "label2Text")
            UserDefaults.standard.set(label3.text, forKey: "label3Text")
            
            UserDefaults.standard.set(mrngbtn1.isSelected, forKey: "mrngbtn1Selected")
            UserDefaults.standard.set(mrngbtn2.isSelected, forKey: "mrngbtn2Selected")
            UserDefaults.standard.set(mrngbtn3.isSelected, forKey: "mrngbtn3Selected")
            
            UserDefaults.standard.set(evengbtn1.isSelected, forKey: "evengbtn1Selected")
            UserDefaults.standard.set(evengbtn2.isSelected, forKey: "evengbtn2Selected")
            UserDefaults.standard.set(evengbtn3.isSelected, forKey: "evengbtn3Selected")
            // Save other relevant data...
            // Save other relevant data...
        }

        func restoreState() {
            print("Restoring state...")
            // Retrieve saved data and restore the state of the screen
            if let label1Text = UserDefaults.standard.string(forKey: "label1Text") {
                label1.text = label1Text
            }
            if let label2Text = UserDefaults.standard.string(forKey: "label2Text") {
                label2.text = label2Text
            }
            if let label3Text = UserDefaults.standard.string(forKey: "label3Text") {
                label3.text = label3Text
            }
            mrngbtn1.isSelected = UserDefaults.standard.bool(forKey: "mrngbtn1Selected")
              mrngbtn2.isSelected = UserDefaults.standard.bool(forKey: "mrngbtn2Selected")
              mrngbtn3.isSelected = UserDefaults.standard.bool(forKey: "mrngbtn3Selected")
              
              evengbtn1.isSelected = UserDefaults.standard.bool(forKey: "evengbtn1Selected")
              evengbtn2.isSelected = UserDefaults.standard.bool(forKey: "evengbtn2Selected")
              evengbtn3.isSelected = UserDefaults.standard.bool(forKey: "evengbtn3Selected")
              // Restore other relevant data...
            // Restore other relevant data...
        }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        restoreState() // Restore state when the view is about to appear
    }
    func setInitialViewState() {
        let currentDate = Date()
        updateDateLabel(date: currentDate)
        updateRoutineStateForSelectedDate(date: currentDate)
    }
    @objc func calendarButtonTapped() {
           let datePickerVC = DatePickerViewController()
           datePickerVC.delegate = self
           datePickerVC.modalPresentationStyle = .overFullScreen
           present(datePickerVC, animated: true, completion: nil)
       }
    func didSelectTimes(morningHour: Int, morningMinute: Int, eveningHour: Int, eveningMinute: Int) {
           UserDefaults.standard.set(morningHour, forKey: "morningNotificationHour")
           UserDefaults.standard.set(morningMinute, forKey: "morningNotificationMinute")
           UserDefaults.standard.set(eveningHour, forKey: "eveningNotificationHour")
           UserDefaults.standard.set(eveningMinute, forKey: "eveningNotificationMinute")
           // Schedule notifications based on selected times
           scheduleMorningNotification()
           scheduleEveningNotification()
       }
    func scheduleMorningNotification() {
           let content = UNMutableNotificationContent()
           content.title = "Morning Routine"
           content.body = "It's time for your morning routine!"
           content.sound = .default

           // Retrieve the hour and minute for the morning notification
           let morningHour = UserDefaults.standard.integer(forKey: "morningNotificationHour")
           let morningMinute = UserDefaults.standard.integer(forKey: "morningNotificationMinute")

           // Create date components for the morning notification
           var dateComponents = DateComponents()
           dateComponents.hour = morningHour
           dateComponents.minute = morningMinute

           // Create the trigger for the notification
           let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

           // Create the request and add it to the notification center
           let request = UNNotificationRequest(identifier: "morningNotification", content: content, trigger: trigger)
           notificationCenter.add(request) { (error) in
               if let error = error {
                   print("Error scheduling morning notification: \(error.localizedDescription)")
               }
           }
       }

       func scheduleEveningNotification() {
           let content = UNMutableNotificationContent()
           content.title = "Evening Routine"
           content.body = "It's time for your evening routine!"
           content.sound = .default

           // Retrieve the hour and minute for the evening notification
           let eveningHour = UserDefaults.standard.integer(forKey: "eveningNotificationHour")
           let eveningMinute = UserDefaults.standard.integer(forKey: "eveningNotificationMinute")

           // Create date components for the evening notification
           var dateComponents = DateComponents()
           dateComponents.hour = eveningHour
           dateComponents.minute = eveningMinute

           // Create the trigger for the notification
           let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

           // Create the request and add it to the notification center
           let request = UNNotificationRequest(identifier: "eveningNotification", content: content, trigger: trigger)
           notificationCenter.add(request) { (error) in
               if let error = error {
                   print("Error scheduling evening notification: \(error.localizedDescription)")
               }
           }
       }
//    func didSelectTime(hour: Int, minute: Int, isMorning: Bool) {
//            if isMorning {
//                UserDefaults.standard.set(hour, forKey: "morningNotificationHour")
//                UserDefaults.standard.set(minute, forKey: "morningNotificationMinute")
//                // Set flag for selecting evening time next
//                UserDefaults.standard.set(false, forKey: "selectingMorningTime")
//                // Present the picker again for evening time
//                performSegue(withIdentifier: "showTimePicker", sender: self)
//            } else {
//                UserDefaults.standard.set(hour, forKey: "eveningNotificationHour")
//                UserDefaults.standard.set(minute, forKey: "eveningNotificationMinute")
//                // All times selected, schedule notifications
//                scheduleMorningNotification()
//            }
//        }

       func didSelectDate(date: Date) {
           updateDateLabel(date: date)
           if Calendar.current.isDateInToday(date) {
                   restoreState() // Restore the state only if the selected date is today
               } else {
                   resetMorningAndEveningRoutine()
               }
          // Re
           updateRoutineStateForSelectedDate(date: date)
           updateExfoliationUIForSelectedDate(date: date)
           }

           
    func updateExfoliationUIForSelectedDate(date: Date) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.weekday], from: date)

        // Check if the selected day is Sunday
        if let weekday = components.weekday, weekday == 1 {
            exfbtn1.isHidden = false
            exfbtn2.isHidden = false
            exfimage.isHidden = false
            label3.isHidden = false
        } else {
            exfbtn2.isHidden = true
            exfimage.isHidden = true
            exfbtn1.isHidden = true
            label3.isHidden = true
        }
    }

       func updateDateLabel(date: Date) {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
           dateLabel.text = dateFormatter.string(from: date)
       }
    func updateRoutineStateForSelectedDate(date: Date) {
        let currentDate = Date()
        if Calendar.current.isDate(date, inSameDayAs: currentDate) {
            // It's today, update the routine state based on the selected date
            let components = Calendar.current.dateComponents([.weekday], from: date)
            if let weekday = components.weekday, weekday == 1 {
                // Sunday, show exfoliation routine
                exfbtn1.isHidden = false
                exfbtn2.isHidden = false
                exfimage.isHidden = false
                label3.isHidden = false
            } else {
                exfbtn2.isHidden = true
                exfimage.isHidden = true
                exfbtn1.isHidden = true
                label3.isHidden = true
            }
        } else {
            // It's not today, reset the morning and evening routines
            resetMorningAndEveningRoutine()
        }
    }

    func resetMorningAndEveningRoutine() {
        mrngbtn1.isSelected = false
        mrngbtn2.isSelected = false
        mrngbtn3.isSelected = false
        label1.text = "Pending"
        
        evengbtn1.isSelected = false
        evengbtn2.isSelected = false
        evengbtn3.isSelected = false
        label2.text = "Pending"
    }

//    func updateRoutineStateForSelectedDate(date: Date) {
//            let calendar = Calendar.current
//            let components = calendar.dateComponents([.weekday], from: date)
//
//            // Check if the selected day is Sunday
//            if let weekday = components.weekday, weekday == 1 {
//                exfbtn1.isHidden = false
//                exfbtn2.isHidden = false
//                exfimage.isHidden = false
//                label3.isHidden = false
//            } else {
//                exfbtn2.isHidden = true
//                exfimage.isHidden = true
//                exfbtn1.isHidden = true
//                label3.isHidden = true
//            }
//        }

    @objc func morningButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        updateMorningRoutineState()
        WidgetCenter.shared.reloadAllTimelines()
        
    }

    @objc func eveningButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        updateEveningRoutineState()
        WidgetCenter.shared.reloadAllTimelines()
       
    }

    @objc func exfoliationButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        updateExfoliationRoutineState()
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    func updateMorningRoutineState() {
        let allSelected = mrngbtn1.isSelected && mrngbtn2.isSelected && mrngbtn3.isSelected
        let status = allSelected ? "Completed" : "Pending"
        label1.text = status
        UserDefaults.standard.set(status, forKey: "morningRoutineStatus")
        print("Morning Routine Status saved as: \(status)")
        checkAndShowCompletionAlert()
    }
    
    func updateEveningRoutineState() {
        let allSelected = evengbtn1.isSelected && evengbtn2.isSelected && evengbtn3.isSelected
        let status = allSelected ? "Completed" : "Pending"
        label2.text = status
        UserDefaults.standard.set(status, forKey: "eveningRoutineStatus")
        print("Evening Routine Status saved as: \(status)")
        checkAndShowCompletionAlert()
    }


    func updateExfoliationRoutineState() {
        let allSelected = exfbtn1.isSelected
        label3.text = allSelected ? "Completed" : "pending"
        checkAndShowCompletionAlert()
    }
    func checkAndShowCompletionAlert() {
        var completedCount = 0
        if let label1Status = label1.text, label1.isHidden == false, label1Status == "Completed" {
            completedCount += 1
        }
        if let label2Status = label2.text, label2.isHidden == false, label2Status == "Completed" {
            completedCount += 1
        }
        if let label3Status = label3.text, label3.isHidden == false, label3Status == "Completed" {
            completedCount += 1
        }

        if completedCount >= 2 {
            // All visible routines are completed, show completion alert
            let alert = UIAlertController(title: "Done for today!", message: "🎉 Great job! You've completed all routines for today. See you again tomorrow! 😊", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func notificationSwitchValueChanged(_ sender: UISwitch) {
//        UserDefaults.standard.set(sender.isOn, forKey: "notificationsEnabled")
//        if sender.isOn {
//            scheduleMorningNotification()
//        } else {
//            removeNotificationAuthorization()
//        }
        UserDefaults.standard.set(sender.isOn, forKey: "notificationsEnabled")
            if sender.isOn {
                performSegue(withIdentifier: "showTimePicker", sender: self)
            } else {
                removeNotificationAuthorization()
            }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTimePicker" {
            if let timePickerVC = segue.destination as? TimePickerViewController {
                timePickerVC.delegate = self
                timePickerVC.isMorning = UserDefaults.standard.bool(forKey: "selectingMorningTime")
            }
        }
    }


    func removeNotificationAuthorization() {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: ["MorningRoutine"])
        notificationCenter.removeAllDeliveredNotifications()
        print("Notification authorization removed")
    }

//    func scheduleMorningNotification() {
//        notificationCenter.getNotificationSettings { (settings) in
//            DispatchQueue.main.async {
//                if settings.authorizationStatus == .authorized {
//                    let morningHour = UserDefaults.standard.integer(forKey: "morningNotificationHour")
//                    let morningMinute = UserDefaults.standard.integer(forKey: "morningNotificationMinute")
//                    self.scheduleRoutineNotification(title: "Morning Routine Reminder", body: "It's time for your morning routine!", hour: morningHour, minute: morningMinute, identifier: "MorningRoutine")
//
//                    let eveningHour = UserDefaults.standard.integer(forKey: "eveningNotificationHour")
//                    let eveningMinute = UserDefaults.standard.integer(forKey: "eveningNotificationMinute")
//                    self.scheduleRoutineNotification(title: "Evening Routine Reminder", body: "It's time for your evening routine!", hour: eveningHour, minute: eveningMinute, identifier: "EveningRoutine")
//                    
//                    self.scheduleWeeklyNotification(title: "Face Exfoliation Reminder", body: "It's time for face exfoliation!", hour: 9, minute: 0, weekday: 7, identifier: "FaceExfoliation")
//                } else {
//                    self.showNotificationSettingsAlert()
//                }
//            }
//        }
//    }

//    func scheduleMorningNotification() {
//        notificationCenter.getNotificationSettings { (settings) in
//            DispatchQueue.main.async {
//                if settings.authorizationStatus == .authorized {
//                    self.scheduleRoutineNotification(title: "Morning Routine Reminder", body: "It's time for your morning routine!", hour: 8, minute: 0, identifier: "MorningRoutine")
//                    self.scheduleRoutineNotification(title: "Evening Routine Reminder", body: "It's time for your evening routine!", hour: 21, minute: 39, identifier: "EveningRoutine")
//                    self.scheduleWeeklyNotification(title: "Face Exfoliation Reminder", body: "It's time for face exfoliation!", hour: 9, minute: 0, weekday: 7, identifier: "FaceExfoliation")
//                } else {
//                    self.showNotificationSettingsAlert()
//                }
//            }
//        }
//    }

    func scheduleRoutineNotification(title: String, body: String, hour: Int, minute: Int, identifier: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notificationCenter.add(request) { error in
            if let error = error {
                print("Error scheduling \(identifier) notification: \(error.localizedDescription)")
            } else {
                print("\(identifier) notification scheduled successfully")
            }
        }
    }

    func scheduleWeeklyNotification(title: String, body: String, hour: Int, minute: Int, weekday: Int, identifier: String) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default

        var dateComponents = DateComponents()
        dateComponents.weekday = weekday
        dateComponents.hour = hour
        dateComponents.minute = minute

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

        notificationCenter.add(request) { error in
            if let error = error {
                print("Error scheduling \(identifier) notification: \(error.localizedDescription)")
            } else {
                print("\(identifier) notification scheduled successfully")
            }
        }
    }

    func showNotificationSettingsAlert() {
        let ac = UIAlertController(title: "Enable Notifications?", message: "To use this feature you must enable notifications in settings", preferredStyle: .alert)
        let goToSettings = UIAlertAction(title: "Settings", style: .default) { (_) in
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
                return
            }

            if UIApplication.shared.canOpenURL(settingsURL) {
                UIApplication.shared.open(settingsURL)
            }
        }
        ac.addAction(goToSettings)
        ac.addAction(UIAlertAction(title: "Cancel", style: .default))
        present(ac, animated: true)
    }

    func setButtonImages() {
        mrngbtn1.setImage(UIImage(named: "unchecked"), for: .normal)
        mrngbtn1.setImage(UIImage(named: "checked"), for: .selected)
        mrngbtn2.setImage(UIImage(named: "unchecked"), for: .normal)
        mrngbtn2.setImage(UIImage(named: "checked"), for: .selected)
        mrngbtn3.setImage(UIImage(named: "unchecked"), for: .normal)
        mrngbtn3.setImage(UIImage(named: "checked"), for: .selected)
        evengbtn1.setImage(UIImage(named: "unchecked"), for: .normal)
        evengbtn1.setImage(UIImage(named: "checked"), for: .selected)
        evengbtn2.setImage(UIImage(named: "unchecked"), for: .normal)
        evengbtn2.setImage(UIImage(named: "checked"), for: .selected)
        evengbtn3.setImage(UIImage(named: "unchecked"), for: .normal)
        evengbtn3.setImage(UIImage(named: "checked"), for: .selected)
        exfbtn1.setImage(UIImage(named: "unchecked"), for: .normal)
        exfbtn1.setImage(UIImage(named: "checked"), for: .selected)
    }
}

