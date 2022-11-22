//
//  QuizesViewController.swift
//  QuizApp
//
//  Created by reromac on 2022-11-17.
//

import UIKit

class QuizesViewController: UIViewController {
    
    var quizManager: QuizManager!
    
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
        if quizManager.questions[quizManager.currentQuestionIndex].correctAnswerIndex == 0 {
            quizManager.calculatePoints(selectedAnswerIndex: 0)
            pointsCounterLabel.text = "Correct, you got \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("Blue true")
        } else {
            quizManager.calculatePoints(selectedAnswerIndex: 0)
            pointsCounterLabel.text = "Incorrect, you lose \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("Blue false")
        }
        if quizManager.checkIfQuizHasMoreQuestions() {
            quizManager.loadQuestion(isInitialQuestion: false)
            getQuestionLabel()
            getAnswersLabels()
        } else {
            showLoginErrorMessage(nil)
        }
    }
    
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        quizManager.calculatePoints(selectedAnswerIndex: 0)
        if quizManager.questions[quizManager.currentQuestionIndex].correctAnswerIndex == 1 {
            pointsCounterLabel.text = "Correct, you got \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("Green true")
        } else {
            pointsCounterLabel.text = "Incorrect, you lose \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("Green false")
        }
        
        if quizManager.checkIfQuizHasMoreQuestions() {
            quizManager.loadQuestion(isInitialQuestion: false)

            getQuestionLabel()
            getAnswersLabels()
        }
        
    }
    
    
    @IBAction func redButtonTapped(_ sender: Any) {
        quizManager.calculatePoints(selectedAnswerIndex: 2)
        if quizManager.questions[quizManager.currentQuestionIndex].correctAnswerIndex == 2 {
            pointsCounterLabel.text = "Correct, you got \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("Red true")
        } else {
            pointsCounterLabel.text = "Incorrect, you lose \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("Red false")
        }
        
        if quizManager.checkIfQuizHasMoreQuestions() {
            quizManager.loadQuestion(isInitialQuestion: false)

            getQuestionLabel()
            getAnswersLabels()
        }
    }
    
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        quizManager.calculatePoints(selectedAnswerIndex: 3)
        if quizManager.questions[quizManager.currentQuestionIndex].correctAnswerIndex == 3 {
            pointsCounterLabel.text = "Correct, you got \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("yellow true")
        } else {
            pointsCounterLabel.text = "Incorrect, you lose \(quizManager.lastQuestionPoints) points!"
            pointsLabel.text = "Points: \(quizManager.points)"
            print("Yellow false")
        }
        
        if quizManager.checkIfQuizHasMoreQuestions() {
            quizManager.loadQuestion(isInitialQuestion: false)

            getQuestionLabel()
            getAnswersLabels()
        }
    }
    
    
    func showLoginErrorMessage(_ errorMessage: String?) {
        let alerAction = UIAlertAction(title: "Close", style: UIAlertAction.Style.destructive, handler: nil)
        let alertController = UIAlertController(title: "Done, you answered all quiz questions", message: errorMessage, preferredStyle: .alert)
        
        alertController.addAction(alerAction)
        self.present(alertController, animated: true)
    }
    
    
    
    
}









