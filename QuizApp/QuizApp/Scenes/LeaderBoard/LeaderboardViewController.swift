//
//  LeaderboardViewController.swift
//  QuizApp
//
//  Created by Povilas Vaitkūnas on 2022-11-16.
//

import UIKit

class LeaderboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(Storage.quizManager!.getUsername())
        print(Storage.quizManager!.getPoints())
    }
}
