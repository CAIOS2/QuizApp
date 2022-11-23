//
//  QuizesViewController.swift
//  QuizApp
//
//  Created by reromac on 2022-11-17.
//

import UIKit

class QuizesViewController: UIViewController {
    
    var quizManager: QuizManager!
    var currentPoints: Int = 0
    var lastPoints: Int = 0
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        incorrectAnswerLabel.isHidden = true
        correctAnswerLabel.isHidden = true
        loadNextQuestion(isInitial: true)
        // Do any additional setup after loading the view.
    }
    
    //MARK: Outlets
    
    @IBOutlet private weak var blueButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var yellowButton: UIButton!
    @IBOutlet private weak var pointsLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    
    @IBOutlet weak var incorrectAnswerLabel: UILabel!
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    @IBAction func onAnswerClicked(_ sender: Any) {
        lastPoints = currentPoints
        switch sender as? UIButton {
        case blueButton:
            currentPoints = quizManager.calculatePoints(selectedAnswerIndex: 0)
        case greenButton:
            currentPoints = quizManager.calculatePoints(selectedAnswerIndex: 1)
        case redButton:
            currentPoints = quizManager.calculatePoints(selectedAnswerIndex: 2)
        case yellowButton:
            currentPoints = quizManager.calculatePoints(selectedAnswerIndex: 3)
        default:
            break
        }
        
        pointsLabel.text = "Points: \(currentPoints)"
        
        if currentPoints > lastPoints {
            correctAnswerLabel.isHidden = false
            incorrectAnswerLabel.isHidden = true
            correctAnswerLabel.text = "Correct! You got \(currentPoints - lastPoints) points"
        } else {
            correctAnswerLabel.isHidden = true
            incorrectAnswerLabel.isHidden = false
            incorrectAnswerLabel.text = "Incorrect! You lost \(lastPoints - currentPoints) points"
        }
        
        loadNextQuestion(isInitial: false)
    }
    
    private func loadNextQuestion(isInitial: Bool) {
        if quizManager.checkIfQuizHasMoreQuestions() {
            let question = quizManager.loadQuestion(isInitialQuestion: isInitial)
            questionLabel.text = question.questionText
            blueButton.setTitle(question.answers[0], for: .normal)
            redButton.setTitle(question.answers[1], for: .normal)
            greenButton.setTitle(question.answers[2], for: .normal)
            yellowButton.setTitle(question.answers[3], for: .normal)
        } else {
            UIAlertController.showErrorAlert(title: "End", message: "Game is finished points: \(currentPoints)", controller: self) { [unowned self] _ in
                self.navigationController?.popViewController(animated: true)
                self.navigationController?.popViewController(animated: true)
            }
        }
        
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
