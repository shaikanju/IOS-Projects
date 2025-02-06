//
//  questions.swift
//  SkinGeniusApp
//
//  Created by CDMStudent on 6/9/24.
//

import Foundation
struct Question {
    let text: String
    let answers: [String]
}

let questionsData: [Question] = [
    Question(text: "How does your skin generally feel?",
             answers: ["Oily and shiny", "Dry and flaky", "Normal and balanced", "Combination (oily in some areas, dry in others)"]),
    Question(text: "How often does your skin react to new skincare products or environmental factors?",
             answers: ["Often, it becomes red and irritated easily", "Sometimes, but not severely", "Rarely, my skin is not very sensitive", "Never, my skin can handle almost anything"]),
    Question(text: "How does your skin feel after washing your face with a gentle cleanser?",
             answers: ["Tight and dry", "Still feels oily", "Fresh and comfortable", "Oily in some areas, tight in others"]),
    Question(text: "How visible are your pores, particularly on your nose and cheeks?",
             answers: ["Very visible and large", "Small and hardly noticeable", "Moderate and visible up close", "Visible only in the T-zone (forehead, nose, chin)"]),
    Question(text: "How often do you experience breakouts or pimples?",
             answers: ["Frequently, almost all the time", "Occasionally, during certain times (stress, hormones)", "Rarely, almost never", "Sometimes, only in specific areas"])
]
