//
//  StartNewGameViewController.swift
//  QuizApp
//
//  Created by tomas vnoctrus on 2022-11-16.
//
import UIKit

class StartNewGameViewController: UIViewController {
    var questionProvider: QuestionProvider!
    
    var questions: [Question] = []
    
//    init(questionProvider: QuestionProvider) {
//        self.questionProvider = questionProvider
//        super.init()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionProvider.getQuestions { [unowned self] questions in
            self.questions = questions
        }
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction private func playGameButtonTapped(_ sender: Any) {
        let quizesVC = QuizesViewController()
        quizesVC.questions = questions
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
