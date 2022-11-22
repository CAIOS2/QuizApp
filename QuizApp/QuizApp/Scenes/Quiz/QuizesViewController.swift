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
        loadNextQuestion(isInitialQuestion: true)
        
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
    
     // MARK: - Navigation
    
    @IBAction func blueButtonTapped(_ sender: Any) {
        correctAnswer(index: 0)
    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
       correctAnswer(index: 1)
    }
    
    @IBAction func redButtonTapped(_ sender: Any) {
        correctAnswer(index: 2)
    }
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
        correctAnswer(index: 3)
    }
    
    func loadNextQuestion(isInitialQuestion: Bool) {
        var currentQuestion = quizManager.loadQuestion(isInitialQuestion: isInitialQuestion)
        questionLabel.text = currentQuestion.questionText
        blueButton.setTitle(currentQuestion.answers[0], for: .normal)
        greenButton.setTitle(currentQuestion.answers[1], for: .normal)
        yellowButton.setTitle(currentQuestion.answers[3], for: .normal)
        redButton.setTitle(currentQuestion.answers[2], for: .normal)
        
    }
    
    func correctAnswer(index: Int) {
       var points = quizManager.calculatePoints(selectedAnswerIndex: index)
        pointsLabel.text = "\(points)"
        loadNextQuestion(isInitialQuestion: false)
    }
    
    func 
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
     //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     //}
    
}
