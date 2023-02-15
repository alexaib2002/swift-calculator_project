//
//  ViewController.swift
//  CalculatorProject
//

import UIKit

let operations: Dictionary = [
    "Sum": sum,
    "Substract": sub,
    "Multiply": mult,
    "Divide": div,
    "Module": mod,
]
var selOperation: (Double, Double) -> Double = operations["Sum"]!

class ViewController: UIViewController {
    @IBOutlet weak var resultLbl: UILabel!
    var res = 0.0
    var mustRepaint = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setOperation(_ sender: UIButton) {
        selOperation = operations[sender.accessibilityHint!]!
        res = Double(resultLbl.text!)!
        mustRepaint = true
    }

    @IBAction func onNbrButtonPressed(_ sender: UIButton) {
        if mustRepaint {
            resultLbl.text = ""
            mustRepaint = false
        }
        resultLbl.text = resultLbl.text! + sender.titleLabel!.text!
    }
    
    @IBAction func onClearButtonPressed(_ sender: Any) {
        resultLbl.text = "0"
        clearCaches()
    }
    
    @IBAction func onPeriodPressed() {
        resultLbl.text = resultLbl.text! + "."
    }
    
    @IBAction func onEnterButtonPressed(_ sender: Any) {
        resultLbl.text = String(startCalculation())
        clearCaches()
        if resultLbl.text == "inf" || resultLbl.text == "nan" {
            resultLbl.text = "Error"
        }
    }
    
    func startCalculation() -> Double {
        return selOperation(res, Double(resultLbl.text!)!)
    }
    
    func clearCaches() {
        res = 0
        mustRepaint = true
    }
}

func sum(a: Double, b: Double) -> Double {
    return a + b
}

func sub(a: Double, b: Double) -> Double {
    return a - b
}

func mult(a: Double, b: Double) -> Double {
    return a * b
}

func div(a: Double, b: Double) -> Double {
    return a / b
}

func mod(a: Double, b: Double) -> Double {
    return a.truncatingRemainder(dividingBy: b)
}
