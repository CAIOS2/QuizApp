//
//  Question.swift
//  QuizApp
//
//  Created by Dmitrij Aneicik on 2022-11-17.
//

import Foundation

class Question {
    var questionText: String
    var answers: [String]
    var category: String
    var correctAnswerIndex: Int
    
    init(questionText:  String, answers: [String], category: String, correctAnswerIndex: Int) {
        self.questionText = questionText
        self.answers = answers
        self.category = category
        self.correctAnswerIndex = correctAnswerIndex

    }
}
