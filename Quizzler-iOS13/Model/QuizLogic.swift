import Foundation

struct QuizLogic {
    let quiz = [
        Question(text: "4 + 7 = 12", answer: "False"),
        Question(text: "21 * 2 = 42", answer: "True"),
        Question(text: "53 - 37 = 26", answer: "False"),
        Question(text: "120 / 4 = 30", answer: "True"),
        Question(text: "6 / 2 * 3 = 1", answer: "False"),
        Question(text: "48 * 3 = 159", answer: "False")
    ]
    
    var questionNumber = 0
    
    func checkAnswer(userAnswer:String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            return true
        }
        else {
            return false
        }
    }
    
    func getQuestion() -> String {
        return quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        }
        else {
            questionNumber = 0
        }
    }
}
