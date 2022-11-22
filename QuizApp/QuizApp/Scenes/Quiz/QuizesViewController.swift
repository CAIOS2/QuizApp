//
//  QuizesViewController.swift
//  QuizApp
//
//  Created by reromac on 2022-11-17.
//

import UIKit

class QuizesViewController: UIViewController {
    
    var questionId: Int = 0
    var question: Question? = nil
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        // Do any additional setup after loading the view.
    }
    
   func loadQuestion() {
        
        self.question = Storage.quizManager!.loadQuestion(i: questionId)
        questionLabel.text! = self.question!.questionText
        
        for i in 0...3 {
            
            loadToWhichButton(answer: self.question!.answers[i], i: i)
        }
    }
    
    func loadToWhichButton(answer: String, i: Int) {
        switch i {
        case 0: blueButton.setTitle(answer, for: .normal)
        case 1: greenButton.setTitle(answer, for: .normal)
        case 2: redButton.setTitle(answer, for: .normal)
        case 3: yellowButton.setTitle(answer, for: .normal)
        default: return
        }
    }
    
    //MARK: Outlets
    
    func updatePointsLabel() {
        pointsLabel.text! = "Points: \(Storage.quizManager!.getPoints())"
    }
    
    func switchToNextQuestion(_ i: Int) {
        if self.question!.correctAnswerIndex == i {
            questionId += 1
            if questionId > 3 {
                // switch to result of answers
                showAlert(title: "Finish", "Jus surinkot \(Storage.quizManager!.getPoints()) taškus")
            }
            loadQuestion()
            updatePointsLabel()
        }
    }
    
    @IBAction func pressGreen(_ sender: Any) {
        switchToNextQuestion(1)
        let _ = Storage.quizManager!.calculatePoints(selectedAnswerIndex: 1)
        updatePointsLabel()
    }
    @IBAction func pressBlue(_ sender: Any) {
        switchToNextQuestion(0)
        let _ = Storage.quizManager!.calculatePoints(selectedAnswerIndex: 0)
        updatePointsLabel()
    }
    @IBAction func pressRed(_ sender: Any) {
        switchToNextQuestion(2)
        let _ = Storage.quizManager!.calculatePoints(selectedAnswerIndex: 2)
        updatePointsLabel()
    }

    @IBAction func pressYellow(_ sender: Any) {
        switchToNextQuestion(3)
        let _ = Storage.quizManager!.calculatePoints(selectedAnswerIndex: 3)
        updatePointsLabel()
    }
    
    @IBOutlet private weak var blueButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var yellowButton: UIButton!
    @IBOutlet private weak var pointsLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    
    func showAlert(title: String, _ message: String) {
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
}


