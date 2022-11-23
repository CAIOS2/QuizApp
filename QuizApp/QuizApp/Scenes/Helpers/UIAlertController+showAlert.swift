//
//  UIAlertController+showAlert.swift
//  QuizApp
//
//  Created by Dmitrij Aneicik on 2022-11-17.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String, _ message: String, onTapAction: ((UIAlertAction) -> Void)? = nil) {
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: onTapAction)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(alertAction)
        
        self.present(alertController, animated: true)
    }
}

