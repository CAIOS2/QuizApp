//
//  QuestionProvider.swift
//  QuizApp
//
//  Created by Tadas Petrikas on 2022-11-23.
//

import Foundation

protocol QuestionProvider {
    func getQuestions(completion: @escaping ([Question]) -> Void)
}
