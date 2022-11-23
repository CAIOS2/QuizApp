//
//  UIAlertController+showAlert.swift
//  QuizApp
//
//  Created by Dmitrij Aneicik on 2022-11-17.
//

import UIKit


extension UIAlertController {

  static func showErrorAlert(title: String, message: String, controller: UIViewController, onTapAction: ((UIAlertAction) -> Void)? = nil) {
    let action = UIAlertAction(title: "Ok", style: .default, handler: onTapAction)
    let alert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(action)

    controller.present(alert, animated: true)
  }

}

