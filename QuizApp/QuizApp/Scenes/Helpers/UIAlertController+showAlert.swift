//
//  UIAlertController+showAlert.swift
//  QuizApp
//
//  Created by Dmitrij Aneicik on 2022-11-17.
//

import UIKit


extension UIAlertController {
    
    static func showErrorAlert(error: String, message: String) -> UIAlertController {
        
        
        let action = UIAlertAction(title: "Ok", style: .default)
            
        let alert =  UIAlertController(title: "message", message: "error", preferredStyle: .alert)
            alert.addAction(action)
            
        return alert
        
    }
    
}
