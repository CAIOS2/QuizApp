//
//  QuizesViewController.swift
//  QuizApp
//
//  Created by reromac on 2022-11-17.
//

import UIKit

class QuizesViewController: UIViewController {
    var quizManager: QuizManager!
    var questionId: Int = 0
    var question: Question!
    var points: Int = 0
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestion()
        // Do any additional setup after loading the view.
    }
    
    func isInitialQuestion() -> Bool {
        if questionId == 0 {
            return false
        }
        return true
    }
    
   func loadQuestion() {
       self.question = self.quizManager!.loadQuestion(isInitialQuestion: isInitialQuestion())
        questionLabel.text! = self.question!.questionText
        for i in 0...3 {
            loadToWhichButton(answer: self.question!.answers[i], i: i)
       }
    }
    
    func finishGame() {
        let leaderboardVC = LeaderboardViewController()
        leaderboardVC.quizManager = quizManager
        self.navigationController?.pushViewController(leaderboardVC, animated: true)
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
        pointsLabel.text! = "Points: \(self.points)"
    }
    
    func switchToNextQuestion(_ i: Int) {
        self.points = self.quizManager!.calculatePoints(selectedAnswerIndex: i)
        if self.question!.correctAnswerIndex == i {
            if self.questionId == 3 {
                self.questionId = 0
                finishGame()
                return
            }
            loadQuestion()
            updatePointsLabel()
            self.questionId += 1
        } else {
            updatePointsLabel()
        }
    }
    
    @IBAction func pressGreen(_ sender: Any) {
        switchToNextQuestion(2)
    }
    @IBAction func pressBlue(_ sender: Any) {
        switchToNextQuestion(1)
    }
    @IBAction func pressRed(_ sender: Any) {
        switchToNextQuestion(3)
    }

    @IBAction func pressYellow(_ sender: Any) {
        switchToNextQuestion(4)
    }
    
    @IBOutlet private weak var blueButton: UIButton!
    @IBOutlet private weak var greenButton: UIButton!
    @IBOutlet private weak var redButton: UIButton!
    @IBOutlet private weak var yellowButton: UIButton!
    @IBOutlet private weak var pointsLabel: UILabel!
    @IBOutlet private weak var questionLabel: UILabel!
    
    
}


