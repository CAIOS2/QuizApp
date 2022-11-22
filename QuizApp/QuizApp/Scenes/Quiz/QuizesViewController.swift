//
//  QuizesViewController.swift
//  QuizApp
//
//  Created by reromac on 2022-11-17.
//

import UIKit

class QuizesViewController: UIViewController {
    
    var quizManager: QuizManager!
    var question:
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        question = quizManager.loadQuestion(isInitialQuestion: true)
        questionLabel.text = question.questionText
        blueButton.setTitle(question.answers[0], for: .normal)
        greenButton.setTitle(question.answers[1], for: .normal)
        redButton.setTitle(question.answers[2], for: .normal)
        yellowButton.setTitle(question.answers[3], for: .normal)
        // Do any additional setup after loading the view.
    }
    
    //MARK: Outlets
    
    @IBOutlet private weak var blueButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var yellowButton: UIButton!
    @IBOutlet private weak var pointsLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    @IBAction func answerTapped(_ sender: UIButton) {
        
        if sender.title == self.question.answers[self.question.correctAnswerIndex] {}
        
    }
    
    
}
