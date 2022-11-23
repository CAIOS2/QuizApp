//
//  QuizesViewController.swift
//  QuizApp
//
//  Created by reromac on 2022-11-17.
//

import UIKit

struct ButtonIndexes {
    let blue: Int = 0
    let green: Int = 1
    let red: Int = 2
    let yellow: Int = 3
    
}



class QuizesViewController: UIViewController {
    
    var quizManager: QuizManager!
   // var tappedButtonIndex: Int
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getQuestionLabel()
        getAnswersLabels()
        pointsCounterLabel.text = ""
    }
    

    
    //MARK: Outlets
    
    @IBOutlet private weak var blueButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var yellowButton: UIButton!
    @IBOutlet private weak var pointsLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet weak var pointsCounterLabel: UILabel!
    
    // MARK: - Functions
    
    func getQuestionLabel() {
        let questionLabelValue = quizManager.questions[quizManager.currentQuestionIndex].questionText
        questionLabel.text = questionLabelValue
        
        print("primary question index: \(quizManager.currentQuestionIndex)")
        
    }
    
    func getAnswersLabels() {
        let answerBlue = quizManager.questions[quizManager.currentQuestionIndex].answers[0]
        let answerGreen = quizManager.questions[quizManager.currentQuestionIndex].answers[1]
        let answerRed = quizManager.questions[quizManager.currentQuestionIndex].answers[2]
        let answerYellow = quizManager.questions[quizManager.currentQuestionIndex].answers[3]
        
        blueButton.setTitle(answerBlue, for: .normal)
        greenButton.setTitle(answerGreen, for: .normal)
        redButton.setTitle(answerRed, for: .normal)
        yellowButton.setTitle(answerYellow, for: .normal)
        
        print("Correct answer index: \(quizManager.questions[quizManager.currentQuestionIndex].correctAnswerIndex))")
    }
    
    
    @IBAction func blueButtonTapped(_ sender: Any) {
        buttonActions(for_index: 0)
    }
    
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        buttonActions(for_index: 1)
    }
    			
    
    @IBAction func redButtonTapped(_ sender: Any) {
        buttonActions(for_index: 2)
    }
    
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        buttonActions(for_index: 3)
    }
    
    
    func showLoginErrorMessage(_ errorMessage: String?) {
        let alerAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.destructive, handler: nil)
        let alertController = UIAlertController(title: "Done, you answered all quiz questions", message: errorMessage, preferredStyle: .alert)
        
        alertController.addAction(alerAction)
        self.present(alertController, animated: true)
        
        // TODO: after close return to homeview
        // TODO: reset some variables in quizmanager
        
    }
    
    
    func buttonActions(for_index index: Int) {
        if quizManager.questions[quizManager.currentQuestionIndex].correctAnswerIndex == index {
            quizManager.calculatePoints(selectedAnswerIndex: index)
            pointsCounterLabel.text = "Correct, you got \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("\(index) true")
        } else {
            quizManager.calculatePoints(selectedAnswerIndex: 0)
            pointsCounterLabel.text = "Incorrect, you lose \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("\(index) false")
        }
        if quizManager.checkIfQuizHasMoreQuestions() {
            quizManager.loadQuestion(isInitialQuestion: false)
            getQuestionLabel()
            getAnswersLabels()
        } else {
            showLoginErrorMessage(nil)
        }
        
        
    }
    
    
    
}









