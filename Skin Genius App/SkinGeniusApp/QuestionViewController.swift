import UIKit
import Foundation


class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var questions: [Question] = []
    var currentQuestionIndex: Int = 0
    var selectedAnswers: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = questionsData
        selectedAnswers = Array(repeating: "", count: questions.count)
        tableView.rowHeight = 90//
        tableView.delegate = self
        tableView.dataSource = self
        
        showCurrentQuestion()
    }
    
    func showCurrentQuestion() {
        guard currentQuestionIndex < questions.count else {
            // All questions answered, proceed to results
            showResults()
            return
        }
        let question = questions[currentQuestionIndex]
        questionLabel.text = question.text
        tableView.reloadData()
    }
    
    func showResults() {
        print("Navigating to results screen.")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let resultsVC = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as? ResultsViewController {
            resultsVC.answers = selectedAnswers
            navigationController?.pushViewController(resultsVC, animated: true)
        } else {
            print("Failed to instantiate ResultsViewController.")
        }
    }
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if currentQuestionIndex < selectedAnswers.count {
            let selectedAnswer = selectedAnswers[currentQuestionIndex]
            if !selectedAnswer.isEmpty {
                // Save the answer
                currentQuestionIndex += 1
                
                if currentQuestionIndex < questions.count {
                    showCurrentQuestion()
                } else {
                    print("All questions answered.")
                    performSegue(withIdentifier: "showResultsSegue", sender: self)
                }
            } else {
                // Show an alert to select an answer
                let alert = UIAlertController(title: "No Answer Selected", message: "Please select an answer before proceeding.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        } else {
            // All questions answered, proceed to results
            performSegue(withIdentifier: "showResultsSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResultsSegue",
           let resultsVC = segue.destination as? ResultsViewController {
            resultsVC.answers = selectedAnswers
        }
    }
    
}

extension QuestionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Current question index: \(currentQuestionIndex)")
        print("Number of questions: \(questions.count)")
        return questions[currentQuestionIndex].answers.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerCell", for: indexPath)
        cell.textLabel?.text = questions[currentQuestionIndex].answers[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedAnswers[currentQuestionIndex] = questions[currentQuestionIndex].answers[indexPath.row]
    }
}

