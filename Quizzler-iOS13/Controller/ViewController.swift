import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizLogic = QuizLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButton(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userCheck = quizLogic.checkAnswer(userAnswer: userAnswer)
        
        if userCheck {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizLogic.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        updateUI()
    }
    
    @objc func updateUI() {
        QuestionLabel.text = quizLogic.getQuestion()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizLogic.getProgress()
    }
    
}

