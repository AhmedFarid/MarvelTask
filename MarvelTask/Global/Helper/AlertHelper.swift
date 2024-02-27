//
//  AlertHelper.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import UIKit

extension UIViewController {

    func showAlert(title: String, message: String, okHandeler: ((UIAlertAction)-> Void)? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: okHandeler)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
