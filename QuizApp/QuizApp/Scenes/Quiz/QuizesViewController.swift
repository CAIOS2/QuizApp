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
    }
    

    
    //MARK: Outlets
    
    @IBOutlet private weak var blueButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var yellowButton: UIButton!
    @IBOutlet private weak var pointsLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    
    
    // MARK: - Functions
    
    func getQuestionLabel() {
        let question = quizManager.questions[quizManager.currentQuestionIndex].questionText
        questionLabel.text = question
        
        
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
            print("Blue true")
        } else {
            print("Blue false")
        }
        
    }
    
    
    @IBAction func greenButtonTapped(_ sender: Any) {
        if quizManager.questions[quizManager.currentQuestionIndex].correctAnswerIndex == 1 {
            print("Green true")
        } else {
            print("Green false")
        }
    }
    
    
    @IBAction func redButtonTapped(_ sender: Any) {
        if quizManager.questions[quizManager.currentQuestionIndex].correctAnswerIndex == 2 {
            print("Red true")
        } else {
            print("Red false")
        }
    }
    
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        if quizManager.questions[quizManager.currentQuestionIndex].correctAnswerIndex == 3 {
            print("yellow true")
        } else {
            print("Yellow false")
        }
    }
    
    
    
    
    
    
}









