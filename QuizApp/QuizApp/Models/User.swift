//
//  User.swift
//  QuizApp
//
//  Created by Dmitrij Aneicik on 2022-11-17.
//

import Foundation

class User {
    let username: String
    var completedQuizCount: Int
    var totalAccuracy: Int
    private var userPoints: Int
    var correctAnswersCount: Int

    init(username: String) {
        self.username = username
        completedQuizCount = 0
        totalAccuracy = 0
        userPoints = 0
        correctAnswersCount = 0
    }

    func calculatePointsForCorrectAnswer(points: Int) {
        // Ka daryti teisingai atsakius klausima
        userPoints += points
        correctAnswersCount += 1
    }

    func calculatePointsForWrongAnswer(points: Int) {
        // Ka daryti neteisingai atsakius klausima
        userPoints -= points
    }

    func totalPoints() -> Int {
        // grazinti kiek useris turi is viso tasku
        return userPoints
    }

    func updateCompletedQuizCount() {
        // iskvieciama baigus zaidimui, reikia zinoti kiek zaidimu is vis useris yra atlikes ir perskaiciuoti jo atsakymu taikluma
        completedQuizCount += 1
        calculateTotalAccuracy()
    }

    func calculateTotalAccuracy() {
        // perskaiciuoti useriu atsakymu taikluma
        let accuracy = (Double(correctAnswersCount) / Double(QuizConstants.numberOfQuestionsPerQuiz * completedQuizCount))
        totalAccuracy = Int(accuracy * 100)
    }
}
