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
    @IBOutlet weak var currentResultsLabel: UILabel!
    
     // MARK: - Navigation
    
    @IBAction func blueButtonTapped(_ sender: Any) {

    }
    
    @IBAction func greenButtonTapped(_ sender: Any) {
    }
    
    @IBAction func redButtonTapped(_ sender: Any) {
    }
    
    @IBAction func yellowButtonTapped(_ sender: Any) {
    }
    
    func loadNextQuestion(isInitialQuestion: Bool) {
        var currentQuestion = quizManager.loadQuestion(isInitialQuestion: isInitialQuestion)
        questionLabel.text = currentQuestion.questionText
        blueButton.setTitle(currentQuestion.answers[0], for: .normal)
        greenButton.setTitle(currentQuestion.answers[1], for: .normal)
        yellowButton.setTitle(currentQuestion.answers[3], for: .normal)
        redButton.setTitle(currentQuestion.answers[2], for: .normal)
        
    }
    

    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
     //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     //}
    
}
