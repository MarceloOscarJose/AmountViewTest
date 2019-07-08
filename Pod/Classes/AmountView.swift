//
//  AmountView.swift
//  AmountView
//
//  Created by Marcelo Oscar José on 08/07/2019.
//

import UIKit

public class AmountView: UIView {

    var configuration: AmountViewConfiguration!

    lazy var amountLabel: UILabel = {
        let amountLabel = UILabel()
        amountLabel.textColor = self.configuration.normalDigitColor
        amountLabel.text = "\(self.configuration.initialValue)"
        amountLabel.font = self.configuration.digitFont
        amountLabel.numberOfLines = 1
        amountLabel.adjustsFontSizeToFitWidth = true
        amountLabel.textAlignment = self.configuration.horizontalAlign
        return amountLabel
    }()
    lazy var hiddenTextField: UITextField = {
        let hiddenTextField = UITextField()
        hiddenTextField.textColor = self.configuration.normalDigitColor
        hiddenTextField.text = "\(self.configuration.initialValue)"
        hiddenTextField.delegate = self
        return hiddenTextField
    }()

    public convenience init() {
        self.init(frame: .zero)
    }

    public func loadConfiguration(_ configuration: AmountViewConfiguration) {
        self.configuration = configuration
        self.setupControls()
    }

    private func setupControls() {
        self.addSubview(amountLabel)
        amountLabel.frame = self.bounds

        self.amountLabel.addSubview(hiddenTextField)
        hiddenTextField.frame = CGRect(x: 10, y: 10, width: 500, height: 50)
        self.hiddenTextField.becomeFirstResponder()
    }
}
