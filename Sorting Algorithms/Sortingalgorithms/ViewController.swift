//
//  ViewController.swift
//  Sortingalgorithms
//
//  Created by CDMStudent on 4/17/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sortingView: SortingView!
    
    @IBOutlet weak var sortingView2: SortingView!
    @IBOutlet weak var sizeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var algorithmSegmentedControl: UISegmentedControl!
    @IBOutlet weak var algorithmSegmentedControl2: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startSorting(_ sender: UIButton) {
        // Get selected array size
        var arraySize = 4
                switch sizeSegmentedControl.selectedSegmentIndex {
                case 0:
                    arraySize = 4
                case 1:
                    arraySize = 8
                case 2:
                    arraySize = 16
                case 3:
                    arraySize = 32
                default:
                    break
                }
                
                // Generate random array
                let randomArray = generateRandomArray(size: arraySize)
                
                // Get selected sorting algorithm
        var sortingAlgorithm1: SortingAlgorithm = .insertion
                switch algorithmSegmentedControl.selectedSegmentIndex {
                case 0:
                    sortingAlgorithm1 = .insertion
                case 1:
                    sortingAlgorithm1 = .selection
                case 2:
                    sortingAlgorithm1 = .quick
                case 3:
                    sortingAlgorithm1 = .bubble
                default:
                    break
                }
        var sortingAlgorithm2: SortingAlgorithm = .insertion
        switch algorithmSegmentedControl2.selectedSegmentIndex {
        case 0:
            sortingAlgorithm2 = .insertion
        case 1:
            sortingAlgorithm2 = .selection
        case 2:
            sortingAlgorithm2 = .quick
        case 3:
            sortingAlgorithm2 = .bubble
        default:
            break
        }
                
                // Start sorting animation
        sortingView.animateSorting(originalArray: randomArray, algorithm: sortingAlgorithm1)
        sortingView2.animateSorting(originalArray: randomArray, algorithm: sortingAlgorithm2)
        }
            
            func generateRandomArray(size: Int) -> [Int] {
               var array: [Int] = []
                for _ in 0..<size {
                    array.append(Int.random(in: 1...100))
                }
                return array
               
            }
        }

        enum SortingAlgorithm {
            case insertion
            case selection
            case quick
            case bubble
        }

class SortingView: UIView {
    let barWidth: CGFloat = 5.0
    let barSpacing: CGFloat = 2.0
    var barHeights: [CGFloat] = []
    var arrayBars: [UIView] = [] // Added arrayBars here
   
        
        // Create bars for each element in the original unsorted array
        func animateSorting(originalArray: [Int], algorithm: SortingAlgorithm) {
            arrayBars.forEach { $0.removeFromSuperview() }
            arrayBars.removeAll()
            for (index, element) in originalArray.enumerated() {
                let barHeight = CGFloat(element) * 1.0 // Adjust the factor as needed
                let barX = CGFloat(index) * (barWidth + barSpacing)
                let barY = bounds.height - barHeight
                let barFrame = CGRect(x: barX, y: barY, width: barWidth, height: barHeight)
                let barView = UIView(frame: barFrame)
                barView.backgroundColor = UIColor.orange // Adjust color as needed
                addSubview(barView)
                arrayBars.append(barView)
            }
            // Execute sorting algorithm on background thread
            DispatchQueue.global(qos: .background).async() {
                // Your code here
                switch algorithm {
                case .insertion:
                    self.insertionSortWithAnimation(originalArray)
                    // Notify completion on the main thread
                    
                case .quick:
                    var arrayCopy = originalArray
                    var isSorted = false
                                   self.quickSortWithAnimation(&arrayCopy, low: 0, high: arrayCopy.count - 1, isSorted: &isSorted)
                    if isSorted {
                        DispatchQueue.main.async {
                            print("Quick sort completed")
                        }
                    }
                    
                case .bubble:
                    var arrayCopy = originalArray // Create a copy of the original array
                    self.bubbleSortWithAnimation(&arrayCopy)
                    
                case .selection:
                    var arrayCopy = originalArray // Create a copy of the original array
                    self.selectionSortWithAnimation(&arrayCopy)
                
                }
                
            }
        }
    private func bubbleSortWithAnimation(_ array: inout [Int]) {
        let n = array.count
        
        for i in 0..<n {
            for j in 0..<n-i-1 {
                if array[j] > array[j+1] {
                    array.swapAt(j, j+1)
                    DispatchQueue.main.async {
                        self.updateBarPositions(barIndex1: j, barIndex2: j+1)
                    }
                    usleep(100_000)
                }
            }
        }
        
        print("Bubble sort completed")
        
    }
    
    
    private func insertionSortWithAnimation(_ array: [Int]) {
        
        var sortedArray = array
        print(sortedArray)
        for i in 0 ..< sortedArray.count {
            var j = i
            while j > 0 && sortedArray[j-1] > sortedArray[j] {
                // Swap the elements in the sortedArray
                sortedArray.swapAt(j-1, j)
                // Animate the swap if the arrayBars array has enough elements
                DispatchQueue.main.async {
                    guard self.arrayBars.indices.contains(j) && self.arrayBars.indices.contains(j - 1) else {
                        
                        return // Skip animation if indices are out of bounds
                    }
                    
                    self.updateBarPositions(barIndex1: j, barIndex2: j-1)// Update the positions immediately
                    
                    
                }
                usleep(300_000)
                
                j -= 1
            }
            
            
        }
        
            print("Insertion sort completed")
        
    }
    private func quickSortWithAnimation(_ array: inout [Int], low: Int, high: Int, isSorted: inout Bool) {
           if low < high {
               let pivotIndex = partition(&array, low: low, high: high)
               quickSortWithAnimation(&array, low: low, high: pivotIndex - 1, isSorted: &isSorted)
               quickSortWithAnimation(&array, low: pivotIndex + 1, high: high, isSorted: &isSorted)
           } else {
               // When low is greater than or equal to high, quick sort is completed
               isSorted = true
           }
       }
    
    private func partition(_ array: inout [Int], low: Int, high: Int) -> Int {
        let pivot = array[high]
        var i = low - 1
        for j in low..<high {
            if array[j] <= pivot {
                i += 1
                array.swapAt(i, j)
                DispatchQueue.main.async {
                    self.updateBarPositions(barIndex1: i, barIndex2: j)
                }
                usleep(300_000)
            }
           
        }
        array.swapAt(i + 1, high)
        DispatchQueue.main.async {
            self.updateBarPositions(barIndex1: i + 1, barIndex2: high)
        }
        usleep(300_000)
        return i + 1
    }
    

    
    private func selectionSortWithAnimation(_ array: inout [Int]) {
        let n = array.count
        for i in 0..<n-1 {
            var minIndex = i
            for j in i+1..<n {
                if array[j] < array[minIndex] {
                    minIndex = j
                }
            }
            if i != minIndex {
                array.swapAt(i, minIndex)
                DispatchQueue.main.async {
                    self.updateBarPositions(barIndex1: i, barIndex2: minIndex)
                }
                usleep(300_000)
            }
        }
                    print("selection sort completed")
        
    }
    
    
    
    private func updateBarPositions(barIndex1: Int, barIndex2: Int) {
        // Get the bars at the specified indices
        let bar1 = arrayBars[barIndex1]
        let bar2 = arrayBars[barIndex2]
        
        
        // Calculate the new positions for the bars
        let bar1X = CGFloat(barIndex2) * (barWidth + barSpacing)
        let bar1Y = bounds.height - bar1.frame.height
        let newFrame1 = CGRect(x: bar1X, y: bar1Y, width: bar1.frame.width, height: bar1.frame.height)
        //print("i was here")
        
        let bar2X = CGFloat(barIndex1) * (barWidth + barSpacing)
        let bar2Y = bounds.height - bar2.frame.height
        let newFrame2 = CGRect(x: bar2X, y: bar2Y, width: bar2.frame.width, height: bar2.frame.height)
        
        // Animate the transition between the old and new positions
        UIView.animate(withDuration: 0.3) {
            bar1.frame = newFrame1
        }
        UIView.animate(withDuration: 0.3) {
            bar2.frame = newFrame2
        }
        arrayBars[barIndex1] = bar2;
        arrayBars[barIndex2] = bar1;
        
    }
    
}

    
    


