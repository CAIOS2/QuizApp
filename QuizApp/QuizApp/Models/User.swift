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
    }

    func calculatePointsForWrongAnswer(points: Int) {
        // Ka daryti neteisingai atsakius klausima
    }

    func totalPoints() -> Int {
        // grazinti kiek useris turi is viso tasku
    }

    func updateCompletedQuizCount() {
        // iskvieciama baigus zaidimui, reikia zinoti kiek zaidimu is vis useris yra atlikes ir perskaiciuoti jo atsakymu taikluma
    }

    func calculateTotalAccuracy() {
        // perskaiciuoti useriu atsakymu taikluma
    }
}
