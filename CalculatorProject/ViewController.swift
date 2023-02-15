//
//  ViewController.swift
//  CalculatorProject
//
//  Created by Usuario invitado on 8/2/23.
//

import UIKit

let operations: Dictionary = [
    "Sum": sum,
    "Substract": sub,
    "Multiply": mult,
    "Divide": div,
    "Module": mod,
]
var selOperation: (Int, Int) -> Int = operations["Sum"]!

class ViewController: UIViewController {
    @IBOutlet weak var resultLbl: UILabel!
    var fRes = 0
    var lRes = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func setOperation(_ sender: Any) {
        if sender is UIButton {
            let senderBtn: UIButton = sender as! UIButton
            print(senderBtn.accessibilityHint!)
            selOperation = operations[senderBtn.accessibilityHint!]!
        }
    }

    @IBAction func onNbrButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func onEnterButtonPressed(_ sender: Any) {
        resultLbl.text = String(startCalculation())
    }
    
    func startCalculation() -> Int {
        return selOperation(fRes, lRes)
    }
}

func sum(a: Int, b: Int) -> Int {
    return a + b
}

func sub(a: Int, b: Int) -> Int {
    return a - b
}

func mult(a: Int, b: Int) -> Int {
    return a * b
}

func div(a: Int, b: Int) -> Int {
    return a / b
}

func mod(a: Int, b: Int) -> Int {
    return a % b
}

