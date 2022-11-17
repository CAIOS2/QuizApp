//
//  HomeViewController.swift
//  QuizApp
//
//  Created by nonamekk on 2022-11-16.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Action
    
    @IBAction private func startGameTapped(_ sender: Any) {
        let startNewGameVC = StartNewGameViewController()
        
        navigationController?.pushViewController(startNewGameVC, animated: true)
    
    }
    
    @IBAction private func leaderboardTapped(_ sender: Any) {
        let leaderboardVC = LeaderboardViewController()
        
        navigationController?.pushViewController(leaderboardVC, animated: true)
    }
    
}

