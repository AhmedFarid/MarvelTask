//
//  KeyboardManagerHelper.swift
//  MarvelTask
//
//  Created by Systems on 27/02/2024.
//

import Foundation
import IQKeyboardManagerSwift

class KeyboardManagerHelper {

    @MainActor class func setupIQKeyboardConfigurations() {
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 8
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.resignFirstResponder()
        IQKeyboardManager.shared.resignOnTouchOutside = true
    }
}
