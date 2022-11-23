//
//  LeaderboardViewController.swift
//  QuizApp
//
//  Created by Povilas Vaitkūnas on 2022-11-16.
//

import UIKit

class LeaderboardViewController: UIViewController {

    var quizManager: QuizManager!
    @IBOutlet weak var usernameListLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showLeaderboardEntryMessage()
        
        print(self.quizManager!.getUsername())
        print(self.quizManager!.getPoints())
    }
    
    func showLeaderboardEntryMessage() {
        let wrongAnswersInARow = self.quizManager.getWrongAnswersInARow()
        let correctAnswersInARow = self.quizManager.getCorrectAnswersInARow()
        var messageAlertText = ""
        if wrongAnswersInARow > correctAnswersInARow {
            messageAlertText = "Wrong answers in a row: \(wrongAnswersInARow)"
        } else {
            messageAlertText = "Correct answers in a row: \(correctAnswersInARow)"
        }
        messageAlertText += ".\nPoints: \(self.quizManager.getPoints())"
        showAlert(title: "Congratulations!", messageAlertText)
    }
    
    func showAlert(title: String, _ message: String) {
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true)
    }
}

let defaults = UserDefaults.standard

struct LeaderboardUser: Decodable, Encodable {
    let username: String
    let points: Int
}

class Leaderboard {
    var leaders: [LeaderboardUser]? = nil
    let key = "leaderboard_user"
    
    init() {
        if let res = get() {
            leaders = res
        }
    }
    
    func get() -> [LeaderboardUser]? {
        if leaders == nil {
            if let res = defaults.string(forKey: key) {
                if let list: [LeaderboardUser]? = instantiate(jsonString: res) {
                    return list
                } else {
                    return nil
                }
            } else {
                return nil
            }
        } else {
            return self.leaders
        }
    }
    
    func sortByPoints(list: [User]) {
        
    }
    
    // update only if points were higher, than previous result
    func update(user: User) {
        let leaderboardUser = LeaderboardUser (
            username: user.username,
            points: user.totalPoints()
        )
        
        
        if let oldList = self.get() {
            var newList: [LeaderboardUser] = []
            var isUserFound = false
            
            for each in oldList {
                if each.username == user.username {
                    isUserFound = true
                    newList.append(leaderboardUser)
                } else {
                    newList.append(each)
                }
            }
            if !isUserFound {
                newList.append(leaderboardUser)
            }
//            sortByPoints(list: <#T##[User]#>)
            self.leaders = newList
            defaults.set(newList.toJSONString(), forKey: key)
            
        } else {
            self.leaders = [leaderboardUser]
            defaults.set([leaderboardUser].toJSONString(), forKey: key)
        }
    }
    
}

extension Encodable {
    func toJSONString() -> String {
        let jsonData = try! JSONEncoder().encode(self)
        return String(data: jsonData, encoding: .utf8)!
    }

}
func instantiate<T: Decodable>(jsonString: String) -> T? {
    return try? JSONDecoder()
    .decode(T.self, from: jsonString.data(using: .utf8)!)
}


