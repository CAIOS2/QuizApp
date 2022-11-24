//
//  LeaderBoardManager.swift
//  QuizApp
//
//  Created by Dmitrij Aneicik on 2022-11-17.
//

import Foundation

class LeaderboardManager {
    func sortTopThreeUsersByPoints(users: [User]) -> [User] {
       // Truksta kodo
        let sortedUsers = users.sorted { user1, user2 in
            user1.totalPoints() > user2.totalPoints()
        }
        let first3Users = Array(sortedUsers.prefix(3))
        return first3Users
    }
}
