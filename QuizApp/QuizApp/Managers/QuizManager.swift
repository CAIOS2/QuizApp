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
    
    private let pointsForAnswer = 2
    
    private var currentQuestionIndex = 0
    private var points = 0
    private var correctAnswersInARow = 0
    private var wrongAnswersInARow = 0
    var currentUser: User!
    
    var questions: [Question] = []
    
    func calculatePoints(selectedAnswerIndex: Int) -> Int {
        // paziureti ar useris teisingai atsake klausima
    }
    
    func loadQuestion(isInitialQuestion: Bool) -> Question {
        // uzkrauti klausima
    }
    
    func checkIfQuizHasMoreQuestions() -> Bool {
        // patikrinti ar paskutinis klausimas
    }
   
    // MARK: - Helpers
    private func calculatePointsForCorrectAnswer() -> Int {
        // paskaiciuoti taskus uz teisinga atsakyma, taskai yra dauginami is dabartinio is eiles atsakytu klausimu skaiciaus
    }
    
    private func calculatePointsForWrongAnswer() -> Int {
        // paskaiciuoti taskus uz neteisinga atsakyma, taskai yra dauginami is dabartinio is eiles neatsakytu klausimu skaiciaus
    }
}

