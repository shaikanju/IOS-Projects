import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var recommendations: UITextView!
//    var savedRecommendations: String?
//    var answers: [String]!
//    
//    override func viewDidLoad() {
//            super.viewDidLoad()
//            
//        if let savedRecommendations = savedRecommendations {
//                // Display saved recommendations
//                recommendations.text = savedRecommendations
//            } else {
//                // Generate recommendations from answers and save them
//                let generatedRecommendations = generateRecommendations(from: answers)
//                recommendations.text = generatedRecommendations
//                saveRecommendations(generatedRecommendations)
//            }
//        }
//    func saveRecommendations(_ recommendations: String) {
//            UserDefaults.standard.set(recommendations, forKey: "SavedRecommendations")
//        }
//    
//    func showSavedRecommendations() {
//        if let savedRecommendations = UserDefaults.standard.string(forKey: "SavedRecommendations") {
//            recommendations.text = savedRecommendations
//        }
//    }
//
//        
//        func generateRecommendations(from answers: [String]) -> String {
//            guard answers.count == 5 else {
//                return "Invalid number of answers provided."
//            }
//            
//            var skinType = ""
//            var sensitivity = ""
//            var poreVisibility = ""
//            var breakouts = ""
//            
//            // Determine skin type
//            switch answers[0] {
//            case "Oily and shiny":
//                skinType = "oily"
//            case "Dry and flaky":
//                skinType = "dry"
//            case "Normal and balanced":
//                skinType = "normal"
//            case "Combination (oily in some areas, dry in others)":
//                skinType = "combination"
//            default:
//                break
//            }
//            
//            // Determine skin sensitivity
//            switch answers[1] {
//            case "Often, it becomes red and irritated easily":
//                sensitivity = "highly sensitive"
//            case "Sometimes, but not severely":
//                sensitivity = "moderately sensitive"
//            case "Rarely, my skin is not very sensitive":
//                sensitivity = "less sensitive"
//            case "Never, my skin can handle almost anything":
//                sensitivity = "non-sensitive"
//            default:
//                break
//            }
//            
//            // Determine pore visibility
//            switch answers[3] {
//            case "Very visible and large":
//                poreVisibility = "large pores"
//            case "Small and hardly noticeable":
//                poreVisibility = "small pores"
//            case "Moderate and visible up close":
//                poreVisibility = "medium pores"
//            case "Visible only in the T-zone (forehead, nose, chin)":
//                poreVisibility = "combination pore visibility"
//            default:
//                break
//            }
//            
//            // Determine breakout frequency
//            switch answers[4] {
//            case "Frequently, almost all the time":
//                breakouts = "frequent breakouts"
//            case "Occasionally, during certain times (stress, hormones)":
//                breakouts = "occasional breakouts"
//            case "Rarely, almost never":
//                breakouts = "rare breakouts"
//            case "Sometimes, only in specific areas":
//                breakouts = "localized breakouts"
//            default:
//                break
//            }
//            
//            // Generate recommendations
//            let recommendation = """
//            Based on your answers, we have the following recommendations for you:
//            
//            - **Skin Type**: \(skinType.capitalized)
//            - **Sensitivity**: \(sensitivity.capitalized)
//            - **Pore Visibility**: \(poreVisibility.capitalized)
//            - **Breakout Frequency**: \(breakouts.capitalized)
//            
//            Here are some skincare tips:
//            \(getSkinTypeRecommendations(skinType))
//            \(getSensitivityRecommendations(sensitivity))
//            \(getPoreRecommendations(poreVisibility))
//            \(getBreakoutRecommendations(breakouts))
//            """
//            
//            return recommendation
//        }
//        
//        func getSkinTypeRecommendations(_ skinType: String) -> String {
//            switch skinType {
//            case "oily":
//                return "- Use oil-free and non-comedogenic products.\n- Consider using a mattifying moisturizer."
//            case "dry":
//                return "- Use hydrating and moisturizing products.\n- Avoid harsh cleansers and exfoliants."
//            case "normal":
//                return "- Use a balanced skincare routine.\n- Maintain hydration and protection."
//            case "combination":
//                return "- Use products that balance oily and dry areas.\n- Consider a gel-based moisturizer."
//            default:
//                return ""
//            }
//        }
//        
//        func getSensitivityRecommendations(_ sensitivity: String) -> String {
//            switch sensitivity {
//            case "highly sensitive":
//                return "- Use fragrance-free and hypoallergenic products.\n- Avoid products with alcohol or harsh chemicals."
//            case "moderately sensitive":
//                return "- Use gentle products and avoid potential irritants.\n- Test new products on a small area first."
//            case "less sensitive":
//                return "- Use products suitable for your skin type.\n- Avoid over-exfoliating."
//            case "non-sensitive":
//                return "- You can experiment with a variety of products.\n- Maintain a consistent routine."
//            default:
//                return ""
//            }
//        }
//        
//        func getPoreRecommendations(_ poreVisibility: String) -> String {
//            switch poreVisibility {
//            case "large pores":
//                return "- Use products with salicylic acid or niacinamide.\n- Consider clay masks to minimize pores."
//            case "small pores":
//                return "- Maintain your current routine to keep pores clear.\n- Avoid heavy makeup."
//            case "medium pores":
//                return "- Use a gentle exfoliant regularly.\n- Keep your skin clean and hydrated."
//            case "combination pore visibility":
//                return "- Use targeted treatments for different areas.\n- Balance your skincare routine."
//            default:
//                return ""
//            }
//        }
//        
//        func getBreakoutRecommendations(_ breakouts: String) -> String {
//            switch breakouts {
//            case "frequent breakouts":
//                return "- Use products with benzoyl peroxide or salicylic acid.\n- Avoid pore-clogging makeup."
//            case "occasional breakouts":
//                return "- Spot treat with appropriate products.\n- Maintain a consistent routine."
//            case "rare breakouts":
//                return "- Keep your skincare routine consistent.\n- Avoid trying too many new products."
//            case "localized breakouts":
//                return "- Use targeted treatments for affected areas.\n- Keep the area clean and avoid touching."
//            default:
//                return ""
//            }
//        }
//    }
//
    var answers: [String]?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            print("ResultsViewController loaded with answers: \(String(describing: answers))")
            
            if let answers = answers {
                let generatedRecommendations = generateRecommendations(from: answers)
                recommendations.text = generatedRecommendations
                saveRecommendations(generatedRecommendations)
            }
        }
        
        func saveRecommendations(_ recommendations: String) {
            UserDefaults.standard.set(recommendations, forKey: "SavedRecommendations")
        }
        
        func generateRecommendations(from answers: [String]) -> String {
            guard answers.count == 5 else {
                return "Invalid number of answers provided."
            }
            
            var skinType = ""
            var sensitivity = ""
            var poreVisibility = ""
            var breakouts = ""
            
            // Determine skin type
            switch answers[0] {
            case "Oily and shiny":
                skinType = "oily"
            case "Dry and flaky":
                skinType = "dry"
            case "Normal and balanced":
                skinType = "normal"
            case "Combination (oily in some areas, dry in others)":
                skinType = "combination"
            default:
                break
            }
            
            // Determine skin sensitivity
            switch answers[1] {
            case "Often, it becomes red and irritated easily":
                sensitivity = "highly sensitive"
            case "Sometimes, but not severely":
                sensitivity = "moderately sensitive"
            case "Rarely, my skin is not very sensitive":
                sensitivity = "less sensitive"
            case "Never, my skin can handle almost anything":
                sensitivity = "non-sensitive"
            default:
                break
            }
            
            // Determine pore visibility
            switch answers[3] {
            case "Very visible and large":
                poreVisibility = "large pores"
            case "Small and hardly noticeable":
                poreVisibility = "small pores"
            case "Moderate and visible up close":
                poreVisibility = "medium pores"
            case "Visible only in the T-zone (forehead, nose, chin)":
                poreVisibility = "combination pore visibility"
            default:
                break
            }
            
            // Determine breakout frequency
            switch answers[4] {
            case "Frequently, almost all the time":
                breakouts = "frequent breakouts"
            case "Occasionally, during certain times (stress, hormones)":
                breakouts = "occasional breakouts"
            case "Rarely, almost never":
                breakouts = "rare breakouts"
            case "Sometimes, only in specific areas":
                breakouts = "localized breakouts"
            default:
                break
            }
            
            // Generate recommendations
            let recommendation = """
            Based on your answers, we have the following recommendations for you:
            
            - **Skin Type**: \(skinType.capitalized)
            - **Sensitivity**: \(sensitivity.capitalized)
            - **Pore Visibility**: \(poreVisibility.capitalized)
            - **Breakout Frequency**: \(breakouts.capitalized)
            
            Here are some skincare tips:
            \(getSkinTypeRecommendations(skinType))
            \(getSensitivityRecommendations(sensitivity))
            \(getPoreRecommendations(poreVisibility))
            \(getBreakoutRecommendations(breakouts))
            """
            
            return recommendation
        }
        
        func getSkinTypeRecommendations(_ skinType: String) -> String {
            switch skinType {
            case "oily":
                return "- Use oil-free and non-comedogenic products.\n- Consider using a mattifying moisturizer."
            case "dry":
                return "- Use hydrating and moisturizing products.\n- Avoid harsh cleansers and exfoliants."
            case "normal":
                return "- Use a balanced skincare routine.\n- Maintain hydration and protection."
            case "combination":
                return "- Use products that balance oily and dry areas.\n- Consider a gel-based moisturizer."
            default:
                return ""
            }
        }
        
        func getSensitivityRecommendations(_ sensitivity: String) -> String {
            switch sensitivity {
            case "highly sensitive":
                return "- Use fragrance-free and hypoallergenic products.\n- Avoid products with alcohol or harsh chemicals."
            case "moderately sensitive":
                return "- Use gentle products and avoid potential irritants.\n- Test new products on a small area first."
            case "less sensitive":
                return "- Use products suitable for your skin type.\n- Avoid over-exfoliating."
            case "non-sensitive":
                return "- You can experiment with a variety of products.\n- Maintain a consistent routine."
            default:
                return ""
            }
        }
        
        func getPoreRecommendations(_ poreVisibility: String) -> String {
            switch poreVisibility {
            case "large pores":
                return "- Use products with salicylic acid or niacinamide.\n- Consider clay masks to minimize pores."
            case "small pores":
                return "- Maintain your current routine to keep pores clear.\n- Avoid heavy makeup."
            case "medium pores":
                return "- Use a gentle exfoliant regularly.\n- Keep your skin clean and hydrated."
            case "combination pore visibility":
                return "- Use targeted treatments for different areas.\n- Balance your skincare routine."
            default:
                return ""
            }
        }
        
        func getBreakoutRecommendations(_ breakouts: String) -> String {
            switch breakouts {
            case "frequent breakouts":
                return "- Use products with benzoyl peroxide or salicylic acid.\n- Avoid pore-clogging makeup."
            case "occasional breakouts":
                return "- Spot treat with appropriate products.\n- Maintain a consistent routine."
            case "rare breakouts":
                return "- Keep your skincare routine consistent.\n- Avoid trying too many new products."
            case "localized breakouts":
                return "- Use targeted treatments for affected areas.\n- Keep the area clean and avoid touching."
            default:
                return ""
            }
        }
    }
