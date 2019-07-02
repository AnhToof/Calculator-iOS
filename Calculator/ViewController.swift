//
//  ViewController.swift
//  Calculator
//
//  Created by TuanAnh on 7/2/19.
//  Copyright © 2019 Toof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum OPERAND: Int {
        case DIVIDE = 10
        case MULTIPLE = 11
        case MINUS = 12
        case PLUS = 13
        case PERCENTAGE = 14
        case CHANGE_VALUE = 15
        case CALCULATE = 16
        case RESET = 17
    }
    
    var mNumberA = 0.0
    var mNumberB = 0.0
    var mOperand = 0
    var mOperandText = "+"
    var mResult = "0"
    
    @IBOutlet weak var mLabelResult: UILabel!
    @IBOutlet var mButtonActions: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func numberPressed(_ sender: UIButton) {
        if mResult == "0" {
            mResult = String(sender.tag)
        } else {
            mResult += String(sender.tag)
        }
        if mOperand == 0 {
            mNumberA += Double(sender.tag)
        } else {
            mNumberB += Double(sender.tag)
        }
        printResult()
    }
    
    @IBAction func operandPressed(_ sender: UIButton) {
        mOperand = sender.tag
        if mResult != "0" {
            switch sender.tag {
            case OPERAND.DIVIDE.rawValue:
                mResult += "÷"
                mOperandText = "÷"
            case OPERAND.MULTIPLE.rawValue:
                mResult += "x"
                mOperandText = "x"
            case OPERAND.PLUS.rawValue:
                mResult += "+"
                mOperandText = "+"
            case OPERAND.MINUS.rawValue:
                mResult += "-"
                mOperandText = "-"
            case OPERAND.PERCENTAGE.rawValue:
                mResult += "%"
                mOperandText = "%"
            default:
                mResult += "+"
                mOperandText = "+"
            }
            printResult()
        }
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        resetValues()
        printResult()
    }
    
    @IBAction func changeValuePressed(_ sender: UIButton) {
        if mOperand == 0 {
            if mNumberA != 0 {
                mNumberA *= -1
                mResult = String(mNumberA)
            }
        } else {
            if mNumberB != 0 {
                mNumberB *= -1
                mResult = "\(mNumberA)\(mOperandText)\(mNumberB)"
            }
        }
        printResult()
    }
    
    @IBAction func calculate(_ sender: UIButton) {
        var result = 0.0
        switch sender.tag {
        case OPERAND.DIVIDE.rawValue:
            result = (mNumberA / mNumberB)
        
        case OPERAND.MULTIPLE.rawValue:
            result = (mNumberA * mNumberB)
        case OPERAND.PLUS.rawValue:
            result = (mNumberA + mNumberB)
        case OPERAND.MINUS.rawValue:
            result = (mNumberA - mNumberB)
        case OPERAND.PERCENTAGE.rawValue:
            if mOperand == 0 {
                mNumberA = (mNumberA / 100)
            } else {
                mNumberB = (mNumberB / 100)
            }
        default:
            result = (mNumberA + mNumberB)
        }
        mResult = String(result)
        printResult()
        resetValues()
    }
    
    func printResult() {
        mLabelResult.text = mResult
    }
    
    func resetValues() {
        mNumberA = 0
        mNumberB = 0
        mOperand = 0
        mResult = "0"
    }
}
