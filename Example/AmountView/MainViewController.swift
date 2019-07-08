//
//  MainViewController.swift
//  AmountView
//
//  Created by MarceloOscarJose on 07/08/2019.
//  Copyright (c) 2019 MarceloOscarJose. All rights reserved.
//

import UIKit
import AmountView

class MainViewController: UIViewController {

    @IBOutlet weak var amountView: AmountView!

    @IBOutlet weak var configurationStack: UIStackView!
    @IBOutlet weak var minValue: UITextField!
    @IBOutlet weak var maxValue: UITextField!
    @IBOutlet weak var initValue: UITextField!
    @IBOutlet weak var maxFontSize: UITextField!
    @IBOutlet weak var decimals: UITextField!
    @IBOutlet weak var prefix: UITextField!
    @IBOutlet weak var verticalAlign: UISegmentedControl!
    @IBOutlet weak var horizontalAlign: UISegmentedControl!
    @IBOutlet weak var invalidColor: UITextField!
    @IBOutlet weak var normalColor: UITextField!
    @IBOutlet weak var applyButton: UIButton!

    @IBOutlet weak var mainView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.amountView.loadConfiguration(self.getConfigs())
    }

    func getConfigs() -> AmountViewConfiguration {
        let amountViewConfigurtion = AmountViewConfiguration()

        if let decimalsText = decimals.text,
            let prefixText = self.prefix.text,
            let maxFontSizeText = self.maxFontSize.text,
            let minValueText = self.minValue.text,
            let maxValueText = self.maxValue.text,
            let initValueString = self.initValue.text,
            let invalidColorString = self.invalidColor.text,
            let normalColorString = self.normalColor.text {
            
            let font = UIFont(name: "TTNorms-Regular", size: 120)!
            let fontScript = UIFont(name: "TTNorms-Medium", size: 60)!
            
            amountViewConfigurtion.decimals = Int(decimalsText)!
            amountViewConfigurtion.maxDigitFontSize = CGFloat(Int(maxFontSizeText)!)
            amountViewConfigurtion.digitFont = font
            amountViewConfigurtion.superScriptDigitFont = fontScript
            amountViewConfigurtion.maxEnabledValue = Decimal(string: maxValueText)!
            amountViewConfigurtion.minEnabledValue = Decimal(string: minValueText)!
            amountViewConfigurtion.horizontalAlign = horizontalAlign.selectedSegmentIndex == 0 ? .center : horizontalAlign.selectedSegmentIndex == 1 ? .left : .right
            amountViewConfigurtion.verticalAlign = verticalAlign.selectedSegmentIndex == 0 ? .middle : verticalAlign.selectedSegmentIndex == 1 ? .top : .bottom
            amountViewConfigurtion.prefix = prefixText
            amountViewConfigurtion.initialValue = Decimal(string: initValueString)!
            amountViewConfigurtion.userNativeKeyboard = true
            amountViewConfigurtion.invalidDigitColor = self.hexStringToUIColor(hex: invalidColorString)
            amountViewConfigurtion.normalDigitColor = self.hexStringToUIColor(hex: normalColorString)
        }

        return amountViewConfigurtion
    }

    @IBAction func appleyChanges(_ sender: Any) {
        self.amountView.loadConfiguration(self.getConfigs())
    }

    func hexStringToUIColor(hex: String) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    func didAppendDigit() {
    }

    func didDeleteDigit() {
    }

    func didEnterValidAmount() {
    }
}

