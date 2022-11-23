//
//  UIAlertController+showAlert.swift
//  QuizApp
//
//  Created by Dmitrij Aneicik on 2022-11-17.
//

import UIKit


extension UIAlertController {

  static func showErrorAlert(title: String, message: String, controller: UIViewController) {


    let action = UIAlertAction(title: "Ok", style: .default)

    let alert =  UIAlertController(title:title, message: message, preferredStyle: .alert)
    alert.addAction(action)

    controller.present(alert, animated: true)

  }

}

