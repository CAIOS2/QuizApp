//
//  QuestionsRepository.swift
//  BlankApp
//
//  Created by Arnas Sleivys on 2022-04-27.
//

import Foundation


//MARK: - Structs

private struct APIResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case response_code
        case results
    }
    
    let response_code: Int
    let results: [QuestionJSON]
}

private struct QuestionJSON: Decodable {
    enum CodingKeys: String, CodingKey {
        case category
        case correct_answer
        case incorrect_answers
        case question
    }
    
    let category: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    let question: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        category = try container.decode(String.self, forKey: .category).removingPercentEncoding!
        correctAnswer = try container.decode(String.self, forKey: .correct_answer).removingPercentEncoding!
        question = try container.decode(String.self, forKey: .question).removingPercentEncoding!
        
        let encodedIncorrectAnswers = try container.decode([String].self, forKey: .incorrect_answers)
        var decodedIncorrectAnswers = [String]()
        
        for encodedIncorrectAnswer in encodedIncorrectAnswers {
            decodedIncorrectAnswers.append(encodedIncorrectAnswer.removingPercentEncoding!)
        }
        incorrectAnswers = decodedIncorrectAnswers
    }
}


// MARK: - Protocols
protocol QuestionProvider {
    func getQuestions(completion: @escaping ([Question]) -> Void)
}

// MARK: - Classes
class Question {
    let questionText: String
    let answers: [String]
    let category: String
    let correctAnswerIndex: Int
    
    fileprivate init(_ questionJSON: QuestionJSON) {
        self.questionText = questionJSON.question
        
        var allAnswers = questionJSON.incorrectAnswers
        allAnswers.append(questionJSON.correctAnswer)
        allAnswers.shuffle()
        
        self.answers = allAnswers
        self.category = questionJSON.category
        self.correctAnswerIndex = allAnswers.firstIndex(of: questionJSON.correctAnswer)!
        
    }
}

final class QuestionsRepository: QuestionProvider {
    func getQuestions(completion: @escaping ([Question]) -> Void) {
        let apiURL  = URL(string: "https://opentdb.com/api.php?amount=50&difficulty=easy&type=multiple&encode=url3986")
        let request = URLRequest(url: apiURL!)

        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { [unowned self] data, _, _ -> Void in
            do {
                let response: APIResponse = try! JSONDecoder().decode(APIResponse.self, from: data!)
                completion(self.parseQuestionsFromResponse(response))
            }
        })
        
        task.resume()
    }
    
    private func parseQuestionsFromResponse(_ response: APIResponse) -> [Question] {
        var questions: [Question] = []

        for questionJSON in response.results {
            
            questions.append(Question( questionJSON))
            }
        return questions
    }
}
