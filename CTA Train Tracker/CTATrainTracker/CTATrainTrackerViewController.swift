import UIKit

class CTATrainTrackerViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    // Define the data model for train arrivals
    struct TrainArrival: Codable {
        let staId: String
        let stpId: String
        let staNm: String
        let stpDe: String
        let rn: String
        let rt: String
        let destSt: String
        let destNm: String
        let trDr: String
        let prdt: String
        let arrT: String
        let isApp: String
        let isSch: String
        let isDly: String
        let isFlt: String
        let flags: String?
        let lat: String?
        let lon: String?
        let heading: String?
        func arrivalTimeInMinutes() -> Int? {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                    guard let arrivalDate = dateFormatter.date(from: arrT) else { return nil }
                    let currentDate = Date()
                    let timeDifference = Int(arrivalDate.timeIntervalSince(currentDate) / 60)
                    return max(0, timeDifference)
                }
    }
    
    // Array to store train arrival data
    var trainArrivals: [TrainArrival] = []
    
    // IBOutlet for UIPickerView
    @IBOutlet weak var pickerView: UIPickerView!
    
    var stationNames = [
        "18th (Loop-bound)",
        "W 18th (54th/Cermak-bound)",
        "N 35th/Archer (Loop-bound)",
        "S 35th/Archer (Midway-bound)",
        "N 35-Bronzeville-IIT (Harlem-bound)",
        "S 35-Bronzeville-IIT (63rd-bound)",
        "N 43rd (Harlem-bound)",
        "S 43rd (63rd-bound)",
        "S 47th (63rd-bound)",
        "N 47th (Harlem-bound)",
        "N 47th (Howard-bound)",
        "S 47th (95th-bound)",
        "N 51st (Harlem-bound)",
        "S 51st (63rd-bound)",
        "E 54th/Cermak (Loop-bound)",
        "W 54th/Cermak (Terminal arrival)",
        "N 63rd (Howard-bound)",
        "S 63rd (95th-bound)",
        "N 69th (Howard-bound)",
        "S 69th (95th-bound)",
        "N 79th (Howard-bound)",
        "S 79th (95th-bound)",
        "N 87th (Howard-bound)",
        "S 87th (95th-bound)",
        "S 95th/Dan Ryan (95th-bound)",
        "N 95th/Dan Ryan (Howard-bound)",
        "S Adams/Wabash (Inner Loop)",
        "N Adams/Wabash (Outer Loop)",
        "S Addison (Forest Pk-bound)",
        "N Addison (O'Hare-bound)",
        "N Addison (Kimball-bound)",
        "S Addison (Loop-bound)",
        "S Addison (95th-bound)",
        "N Addison (Howard-bound)",
        "N Argyle (Howard-bound)",
        "S Argyle (95th-bound)",
        "S Armitage (Loop-bound)",
        "N Armitage (Kimball-Linden-bound)",
        "E Ashland (Loop-63rd-bound)",
        "W Ashland (Harlem-54th/Cermak-bound)",
        "N Ashland (Loop-bound)",
        "S Ashland (Midway-bound)",
        "W Ashland/63rd (Terminal arrival)",
        "E Ashland/63rd (Harlem-bound)",
        "E Austin (O'Hare-bound)",
        "W Austin (Forest Pk-bound)",
        "E Austin (63rd-bound)",
        "W Austin (Harlem-bound)",
        "S Belmont (O'Hare Branch) (Forest Pk-bound)",
        "N Belmont (O'Hare Branch) (O'Hare-bound)",
        "S Belmont (Loop-bound)",
        "S Belmont (95th-bound)"
    ]

    var stationMapIds = [
        "40830",
        "40830",
        "40120",
        "40120",
        "41120",
        "41120",
        "41270",
        "41270",
        "41080",
        "41080",
        "41230",
        "41230",
        "40130",
        "40130",
        "40580",
        "40580",
        "40910",
        "40910",
        "40990",
        "40990",
        "40240",
        "40240",
        "41430",
        "41430",
        "40450",
        "40450",
        "40680",
        "40680",
        "41240",
        "41240",
        "41440",
        "41440",
        "41420",
        "41420",
        "41200",
        "41200",
        "40660",
        "40660",
        "40170",
        "40170",
        "41060",
        "41060",
        "40290",
        "40290",
        "40010",
        "40010",
        "41260",
        "41260",
        "40060",
        "40060",
        "41320",
        "41320"
    ]

    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        // Select the first row by default
        pickerView.selectRow(0, inComponent: 0, animated: false)
        
        fetchTrainData(mapId: stationMapIds.first ?? "")
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(fetchAndUpdateData), userInfo: nil, repeats: true)
    }
    
    // MARK: - UIPickerViewDataSource methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stationNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stationNames[row]
    }
    
    // MARK: - UIPickerViewDelegate methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedMapId = stationMapIds[row]
        fetchTrainData(mapId: selectedMapId)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the count of all train arrivals
        return trainArrivals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Get the TrainArrival object for the current row
        let arrival = trainArrivals[indexPath.row]
        
        // Set destination name as the text label of the cell
        cell.textLabel?.text = arrival.destNm
        
        // Extract arrival time in minutes for the current arrival
        if let arrivalTime = arrival.arrivalTimeInMinutes() {
            cell.detailTextLabel?.text = "\(arrivalTime) min"
        } else {
            cell.detailTextLabel?.text = "N/A"
        }
        
        // Set cell background color based on the value of rt
        switch arrival.rt {
            case "Blue":
                cell.backgroundColor = .systemBlue
            case "Brn":
                cell.backgroundColor = .brown
            case "Red":
                cell.backgroundColor = .red
            case "G":
                cell.backgroundColor = .green
            case "Org":
                cell.backgroundColor = .orange
            case "Pink":
                cell.backgroundColor = .systemPink
            case "P":
                cell.backgroundColor = .purple
            default:
                cell.backgroundColor = .white // Default color
        }
        
        return cell
    }

//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Filter out unique destination names
//        let uniqueDestinations = Set(trainArrivals.map { $0.destNm })
//        // Return the count of unique destinations
//        return uniqueDestinations.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//        
//        // Filter out unique destination names
//        let uniqueDestinations = Set(trainArrivals.map { $0.destNm })
//        let destinationsArray = Array(uniqueDestinations)
//        
//        // Check if the current index is within the range of unique destinations
//        if indexPath.row < destinationsArray.count {
//            let currentDestination = destinationsArray[indexPath.row]
//            
//            // Find all arrivals with the same destination name
//            let sameDestinationArrivals = trainArrivals.filter { $0.destNm == currentDestination }
//            
//            // Extract arrival times in minutes for the current destination
//            let arrivalTimes = sameDestinationArrivals.compactMap { $0.arrivalTimeInMinutes() }
//            
//            // Concatenate arrival times with commas
//            let arrivalTimesString = arrivalTimes.map { "\($0) min" }.joined(separator: ", ")
//            
//            // Set destination name as the text label of the cell
//            cell.textLabel?.text = currentDestination
//            
//            // Set arrival times as the detail text label of the cell
//            cell.detailTextLabel?.text = arrivalTimesString
//            
//            // Set cell background color based on the value of rt
//            if let currentArrival = sameDestinationArrivals.first {
//                switch currentArrival.rt {
//                    case "Blue":
//                        cell.backgroundColor = .systemBlue
//                    case "Brn":
//                        cell.backgroundColor = .brown
//                    case "Red":
//                        cell.backgroundColor = .red
//                    case "G":
//                        cell.backgroundColor = .green
//                    case "Org":
//                        cell.backgroundColor = .orange
//                    case "Pink":
//                        cell.backgroundColor = .systemPink
//                    case "P":
//                        cell.backgroundColor = .purple
//                    default:
//                        cell.backgroundColor = .white // Default color
//                }
//            }
//        } else {
//            // Hide the cell if the index is beyond the range of unique destinations
//            cell.textLabel?.text = nil
//            cell.detailTextLabel?.text = nil
//            cell.backgroundColor = .clear
//        }
//        
//        return cell
//    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let arrival = trainArrivals[indexPath.row]
        performSegue(withIdentifier: "ShowServiceDetailsSegue", sender: arrival)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowServiceDetailsSegue" {
            // Check if the sender is a TrainArrival object
            if let arrival = sender as? TrainArrival {
                // Pass the TrainArrival object to the destination view controller
                if let destinationVC = segue.destination as? ServiceDetailsViewController {
                    destinationVC.serviceDescription = arrival.stpDe
                    destinationVC.stationName = arrival.staNm
                    destinationVC.route = arrival.rt
                    destinationVC.direction = arrival.trDr
                }
            }
        }
    }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShowServiceDetailsSegue" {
//            if let indexPath = sender as? IndexPath {
//                let arrival = trainArrivals[indexPath.row]
//                if let destinationVC = segue.destination as? ServiceDetailsViewController {
//                    destinationVC.serviceDescription = arrival.stpDe
//                    destinationVC.stationName = arrival.staNm
//                    destinationVC.route = arrival.rt
//                    destinationVC.direction = arrival.trDr
//                }
//            }
//        }
//    }

    func fetchTrainData(mapId: String) {
        print("Fetching train data for map ID: \(mapId)")
        guard let url = URL(string: "https://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key=a0d57997f53d429d88a79ac3cfb187c1&mapid=\(mapId)&outputType=json") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("No data received from the API")
                return
            }
            
            // Decode the JSON data
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode([String: TrainArrivalResponse].self, from: data)
                if let eta = response["ctatt"]?.eta {
                    self.trainArrivals = eta
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch let error {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }

@objc func fetchAndUpdateData() {
    print("Fetching and updating data...")
        // Fetch data for the currently selected station
        if let selectedMapId = stationMapIds.first(where: { $0 == stationMapIds[pickerView.selectedRow(inComponent: 0)] }) {
            fetchTrainData(mapId: selectedMapId)
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}

// Define a struct to represent the response from the API
struct TrainArrivalResponse: Codable {
    let tmst: String
    let errCd: String
    let errNm: String?
    let eta: [CTATrainTrackerViewController.TrainArrival]
}


