//
//  ViewController.swift
//  QuizApp
//
//  Created by nonamekk on 2022-11-16.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //MARK: - Action
    
    @IBAction private func startGameTapped(_ sender: Any) {
    }
    
    @IBAction private func leaderboardTapped(_ sender: Any) {
        let leaderboardVC = LeaderboardViewControler()
        
        navigationController?.pushViewController(leaderboardVC, animated: true)
    }
    
}


