//
//  HomeViewController.swift
//  QuizApp
//
//  Created by nonamekk on 2022-11-16.
//

import UIKit

class HomeViewController: UIViewController {
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Action
    
    class MockQuestionProvider: QuestionProvider {
        func getQuestions(completion: @escaping ([Question]) -> Void) {
            completion([Question(
                questionText: "Klausimas",
                answers: ["a", "b", "c", "d"],
                category: "question",
                correctAnswerIndex: 2)])
        }
    }
    @IBAction private func startGameTapped(_ sender: Any) {
        let startNewGameVC = StartNewGameViewController()
        startNewGameVC.questionProvider = QuestionsRepository() //QuestionsRepository()
        
        startNewGameVC.delegate = userManager
        
        navigationController?.pushViewController(startNewGameVC, animated: true)
    
    }
    
    @IBAction private func leaderboardTapped(_ sender: Any) {
        let leaderboardVC = LeaderboardViewController()
        leaderboardVC.leaderboardManagerDelegate = userManager
        
        navigationController?.pushViewController(leaderboardVC, animated: true)
    }
    
}


