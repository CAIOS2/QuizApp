//
//  StartNewGameViewController.swift
//  QuizApp
//
//  Created by tomas vnoctrus on 2022-11-16.
//
import UIKit

protocol NewGameViewDelegate: AnyObject {
   func createNewUser(username: String) -> User
}

class StartNewGameViewController: UIViewController {
    var questionProvider: QuestionProvider!
    var quizManager: QuizManager!
    var delegate: NewGameViewDelegate?
    
    
//  init(questionProvider: QuestionProvider) {
//        self.questionProvider = questionProvider
//        super.init()
//    }
    @IBOutlet private weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        questionProvider.getQuestions { [unowned self] questions in
            self.quizManager = QuizManager(
                user: User(username: "Useris"),
                questions: questions)
        }
    }
    
    // MARK: - Actions
    @IBAction private func playGameButtonTapped(_ sender: Any) {
        if usernameTextField.text! == "" {
            UIAlertController.showErrorAlert(
                title: "Error",
                message: "Please, enter username",
                controller: self
            ) {
                _ in
            }
            return
        }
        
        
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
