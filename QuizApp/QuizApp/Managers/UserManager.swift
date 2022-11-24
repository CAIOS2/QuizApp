//
//  UserManager.swift
//  QuizApp
//
//  Created by Dmitrij Aneicik on 2022-11-17.
//

import Foundation

final class UserManager {
    var users = [User]()
}

extension UserManager: NewGameViewDelegate {
    func createNewUser(username: String) -> User {
        let user = User(username: username)
        self.users.append(user)
        return user
    }
}

//
//extension UserManager: NewGameViewDelegate {
//    func createNewUser(username: String) -> User {
//        // Truksta kodo
//    }
//}
//
//extension UserManager: LeaderboardManaging {
//    func hasAnyonePlayed() -> Bool {
//        // Truksta kodo
//    }
//    
//    func allPlayers() -> [User] {
//        // Truksta kodo
//    }
//}

