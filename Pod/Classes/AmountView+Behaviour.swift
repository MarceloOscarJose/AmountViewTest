//
//  AmountView+Behaviour.swift
//  AmountView
//
//  Created by Marcelo Oscar José on 08/07/2019.
//

import UIKit

extension AmountView: UITextFieldDelegate {

    public func textField(_ textField: UITextField, shouldChangeCharactersIn _: NSRange, replacementString string: String) -> Bool {
        if self.hiddenTextField == textField {
            if string.isEmpty {
                self.deleteDigit()
            } else if let digit = Int(string) {
                self.appendDigit(digit)
            } else {
                return false
            }
        }

        return true
    }

    func appendDigit(_ digit: Int) {
        self.amountLabel.text?.append(Character("\(digit)"))
    }

    func deleteDigit() {
        self.amountLabel.text?.removeLast()
    }
}
