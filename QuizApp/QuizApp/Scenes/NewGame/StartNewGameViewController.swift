//
//  StartNewGameViewController.swift
//  QuizApp
//
//  Created by tomas vnoctrus on 2022-11-16.
//

import UIKit

class StartNewGameViewController: UIViewController {
    let questionRepository: QuestionsRepository = QuestionsRepository()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // MARK: - Actions
    @IBAction private func playGameButtonTapped(_ sender: Any) {
        let quizesVC = QuizesViewController()
        navigationController?.pushViewController(quizesVC, animated: true)
    
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
