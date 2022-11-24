//
//  LeaderboardViewController.swift
//  QuizApp
//
//  Created by Povilas Vaitkūnas on 2022-11-16.
//

import UIKit

protocol LeaderboardManaging: AnyObject {
    func hasAnyonePlayed() -> Bool
    func allPlayers() -> [User]
}

class LeaderboardViewController: UIViewController {

    //MARK: - Properties
    
   weak var leaderboardManagerDelegate: LeaderboardManaging?
    var leaderboardManager = LeaderboardManager()
    var sortedUsers: [User] = []
    
    //MARK: - Outlets
  @IBOutlet private weak var firstButton: UIButton!
  @IBOutlet private weak var secondButton: UIButton!
  @IBOutlet private weak var thirdButton: UIButton!
  

    override func viewDidLoad() {
        super.viewDidLoad()

        //TODO: Hide three buttons
        
        firstButton.isHidden = true
        secondButton.isHidden = true
        thirdButton.isHidden = true
        
        //TODO: Set `sortedUsers` property
        
        if let players = leaderboardManagerDelegate?.allPlayers() {
            
           sortedUsers = leaderboardManager.sortTopThreeUsersByPoints(users: players)
        }
         
        updateLabels()
    }
    
    //MARK: - Actions
    
    //TODO: Move button actions
    
    //MARK: - Private
    
    private func updateLabels() {
        
        if sortedUsers.isEmpty {
            updateButtonsNoUsers()
            return
        }
        
        //TODO: Add implementation for buttons show/hide logic
        if sortedUsers.count >= 1 {
            firstButton.setTitle(sortedUsers[0].username + " " + "\(sortedUsers[0].totalPoints())", for: .normal)
            firstButton.isHidden = false
        }
        
        if sortedUsers.count >= 2 {
            secondButton.setTitle(sortedUsers[1].username + " " + "\(sortedUsers[1].totalPoints())", for: .normal)
            secondButton.isHidden = false
        }
        
        if sortedUsers.count == 3 {
            thirdButton.setTitle(sortedUsers[2].username + " " + "\(sortedUsers[2].totalPoints())", for: .normal)
            thirdButton.isHidden = false
        }
        
        //TODO: Add implementation for button titles
        
    }
    
    private func updateButtonsNoUsers() {
        //TODO: Show message on the button then there is no users played
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
