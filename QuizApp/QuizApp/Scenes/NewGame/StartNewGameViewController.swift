//
//  StartNewGameViewController.swift
//  QuizApp
//
//  Created by tomas vnoctrus on 2022-11-16.
//
import UIKit

class StartNewGameViewController: UIViewController {
    var questionProvider: QuestionProvider!
    var quizManager: QuizManager!
    

//    init(questionProvider: QuestionProvider) {
//        self.questionProvider = questionProvider
//        super.init()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionProvider.getQuestions { [unowned self] questions in
            quizManager = QuizManager(
                user: User(username: "Useris"),
                questions: questions
            )
        }

    }
    
    // MARK: - Actions
    @IBAction private func playGameButtonTapped(_ sender: Any) {
        let quizesVC = QuizesViewController()
        quizesVC.quizManager = quizManager
        self.navigationController?.pushViewController(quizesVC, animated: true)
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
