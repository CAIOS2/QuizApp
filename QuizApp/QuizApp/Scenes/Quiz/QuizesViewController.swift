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
    
    // MARK: - Outlets
    
    @IBOutlet private weak var pointsLabel: UILabel!
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private var blueButton: UIButton!
    @IBOutlet private var greenButton: UIButton!
    @IBOutlet private var redButton: UIButton!
    @IBOutlet private var yellowButton: UIButton!
    
    // MARK: - Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.numberOfLines = 0
        blueButton.titleLabel?.numberOfLines = 0
        greenButton.titleLabel?.numberOfLines = 0
        redButton.titleLabel?.numberOfLines = 0
        yellowButton.titleLabel?.numberOfLines = 0
        loadQuestions()
    }
    
    // MARK: - Events
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        let source = sender as! UIButton
        var buttonIndex: Int = 0
        
        switch source {
        case blueButton:    buttonIndex = 0
        case greenButton:   buttonIndex = 1
        case redButton:     buttonIndex = 2
        case yellowButton:  buttonIndex = 3
        default: return
        }
        
        let wasCorrect = quizManager.didAnswer(index: buttonIndex)
        let text = wasCorrect ? "Correct" : "Incorrect"
        pointsLabel.text = "\(text). You now have \(quizManager.getPoints()) points"
        
        loadQuestions()
    }
    
    // MARK: - Actions
    
    private func loadQuestions() {
        guard let question = quizManager.loadQuestion() else {
            gameFinishedPopup()
            return
        }
        
        questionLabel.text = question.questionText
        
        blueButton.setTitle(question.answers[0], for: .normal)
        greenButton.setTitle(question.answers[1], for: .normal)
        redButton.setTitle(question.answers[2], for: .normal)
        yellowButton.setTitle(question.answers[3], for: .normal)
    }
    
    private func gameFinishedPopup() {
        let view = UIAlertController(
            title: "Game Finished",
            message: "You got \(quizManager.getPoints()) points!",
            preferredStyle: .alert)
        
        let actions = [
            UIAlertAction(
                title: "Restart",
                style: .default)
        ]
        
        for action in actions {
            view.addAction(action)
        }
        
        present(view, animated: true)
    }
    
}
