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
    
    private var currentQuestionIndex = 0
    private var points = 0
    private var correctAnswersInARow = 0
    private var wrongAnswersInARow = 0

    init(user: User, questions: [Question]) {
        self.currentUser = user
        self.questions = questions
    }
    
    func getPoints() -> Int { points }
    
    func didAnswer(index: Int) -> Bool {
        let wasCorrect = questions[currentQuestionIndex].correctAnswerIndex == index
        if wasCorrect {
            calculatePointsForCorrectAnswer()
        } else {
            calculatePointsForWrongAnswer()
        }
        return wasCorrect
    }
    
    func loadQuestion() -> Question? {
        // uzkrauti klausima
        if currentQuestionIndex + 1 < QuizConstants.numberOfQuestionsPerQuiz {
            currentQuestionIndex += 1
            return questions[currentQuestionIndex]
        } else {
            resetGame()
            return nil
        }
    }
   
    // MARK: - Helpers
    
    private func resetGame() {
        currentQuestionIndex = 0
        points = 0
        correctAnswersInARow = 0
        wrongAnswersInARow = 0
    }
    
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

