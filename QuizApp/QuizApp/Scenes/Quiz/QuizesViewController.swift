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
    
    //MARK: - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blueButton = AnswerButton(index: 0)
        greenButton = AnswerButton(index: 1)
        redButton = AnswerButton(index: 2)
        yellowButton = AnswerButton(index: 3)
        
        loadQuestions()
    }
    
    //MARK: Outlets
    
    @IBOutlet private weak var pointsLabel: UILabel!
    
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private var blueButton: AnswerButton!
    @IBOutlet private var greenButton: AnswerButton!
    @IBOutlet private var redButton: AnswerButton!
    @IBOutlet private var yellowButton: AnswerButton!
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        let source = sender as! AnswerButton
        
        let idx = source.idx
        let points = quizManager.calculatePoints(selectedAnswerIndex: idx)
        
        if idx == correctIndex {
            pointsLabel.text = "Correct you got \(points) points"
        } else {
            pointsLabel.text = "Incorrect you lose \(points) points"
        }
        
        if quizManager.checkIfQuizHasMoreQuestions() {
            loadQuestions()
        } else {
            questionLabel.text = "Game finished"
        }
    }
    
    private func loadQuestions() {
        // 1 pasiimti klausima
        let question: Question = quizManager.loadQuestion(isInitialQuestion: quizManager.currentQuestionIndex == 0)
        
        // 2 sudeti texta
        questionLabel.text = question.questionText
        
        blueButton!.titleLabel?.text = question.answers[blueButton.idx]
        greenButton!.titleLabel?.text = question.answers[greenButton.idx]
        redButton!.titleLabel?.text = question.answers[redButton.idx]
        yellowButton!.titleLabel?.text = question.answers[yellowButton.idx]
        
        correctIndex = question.correctAnswerIndex
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
