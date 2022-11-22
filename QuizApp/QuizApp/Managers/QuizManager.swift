//
//  QuizManager.swift
//  QuizApp
//
//  Created by Dmitrij Aneicik on 2022-11-17.
//

import Foundation

class QuizConstants {
    static let numberOfQuestionsPerQuiz = 5
}

final class QuizManager {
    private let currentUser: User
    private let questions: [Question]
    private let pointsForAnswer = 2
    
    var currentQuestionIndex = 0
    private var points = 0
    private var correctAnswersInARow = 0
    private var wrongAnswersInARow = 0

    init(user: User, questions: [Question]) {
        self.currentUser = user
        self.questions = questions
    }
    
    func calculatePoints(for index: Int) -> Int {
        // paziureti ar useris teisingai atsake klausima
        if questions[currentQuestionIndex].correctAnswerIndex == index {
            calculatePointsForCorrectAnswer()
        } else {
            calculatePointsForWrongAnswer()
        }
        
        return points
    }
    
    func getPoints() -> Int {
        points
    }
    func resetGame() {
        currentQuestionIndex = 0
        points = 0
        correctAnswersInARow = 0
        wrongAnswersInARow = 0
    }
    
    func loadQuestion() -> Question {
        // uzkrauti klausima
        currentQuestionIndex += 1
        return questions[currentQuestionIndex]
    }

    func hasMoreQuestions() -> Bool {
        currentQuestionIndex + 1 < QuizConstants.numberOfQuestionsPerQuiz
    }
   
    // MARK: - Helpers
    private func calculatePointsForCorrectAnswer() {
        // paskaiciuoti taskus uz teisinga atsakyma, taskai yra dauginami is dabartinio is eiles atsakytu klausimu skaiciaus
        correctAnswersInARow += 1
        wrongAnswersInARow = 0

        let calculatedPoints = pointsForAnswer * correctAnswersInARow
        points += calculatedPoints
        currentUser.calculatePointsForWrongAnswer(points: points)
    }
    
    private func calculatePointsForWrongAnswer() {
        // paskaiciuoti taskus uz neteisinga atsakyma, taskai yra dauginami is dabartinio is eiles neatsakytu klausimu skaiciaus
        wrongAnswersInARow += 1
        correctAnswersInARow = 0
        
        let calculatedPoints = pointsForAnswer * wrongAnswersInARow
        points -= calculatedPoints
        currentUser.calculatePointsForWrongAnswer(points: calculatedPoints)
    }
}

