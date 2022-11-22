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
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
