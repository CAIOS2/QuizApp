//
//  QuizesViewController.swift
//  QuizApp
//
//  Created by reromac on 2022-11-17.
//

// TODO: make popup when no more questions

import UIKit

class AnswerButton: UIButton {
    var idx: Int
    
    init(index: Int) {
        self.idx = index
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class QuizesViewController: UIViewController {
    
    var quizManager: QuizManager!
    private var correctIndex: Int = 0
    
    //MARK: Outlets
    
    @IBOutlet private weak var pointsLabel: UILabel!
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private var blueButton: UIButton!
    @IBOutlet private var greenButton: UIButton!
    @IBOutlet private var redButton: UIButton!
    @IBOutlet private var yellowButton: UIButton!
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.numberOfLines = 0
        blueButton.titleLabel?.numberOfLines = 0
        greenButton.titleLabel?.numberOfLines = 0
        redButton.titleLabel?.numberOfLines = 0
        yellowButton.titleLabel?.numberOfLines = 0
        loadQuestions()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let source = sender as! UIButton
        var buttonIndex: Int = 0
        
        switch source {
        case blueButton: buttonIndex = 0
        case greenButton: buttonIndex = 1
        case redButton: buttonIndex = 2
        case yellowButton: buttonIndex = 3
        default: {}()
        }
        
        let points = quizManager.calculatePoints(for: buttonIndex)
        
        if buttonIndex == correctIndex {
            pointsLabel.text = "Correct. You now have \(points) points"
        } else {
            pointsLabel.text = "Incorrect. You now have \(points) points"
        }
        
        if quizManager.hasMoreQuestions() {
            loadQuestions()
        } else {
            finishedPopup()
            questionLabel.text = "Game finished"
        }
    }
    
    private func loadQuestions() {
        // 1 pasiimti klausima
        let question: Question = quizManager.loadQuestion()
        
        // 2 sudeti texta
        questionLabel.text = question.questionText
        
        blueButton.setTitle(question.answers[0], for: .normal)
        greenButton.setTitle(question.answers[1], for: .normal)
        redButton.setTitle(question.answers[2], for: .normal)
        yellowButton.setTitle(question.answers[3], for: .normal)
        
        correctIndex = question.correctAnswerIndex
    }
    
    
    private func finishedPopup() {
        let view = UIAlertController(
            title: "Game Finished",
            message: "You got \(quizManager.getPoints()) points!",
            preferredStyle: .alert)
        
        let actions = [
            UIAlertAction(
                title: "Restart",
                style: .default,
                handler: { [unowned self] _ in
                    self.quizManager.resetGame()
                })
        ]
        
        for action in actions {
            view.addAction(action)
        }
        
        present(view, animated: true)
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
