//
//  ViewController.swift
//  CalculatorX
//
//  Created by 傅晨旭 on 2017/3/9.
//  Copyright © 2017年 傅晨旭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var Result : Double = 0
    var previousNumber : Double = 0
    var latterNumber: Double = 0
    var doingMath = false
    var operation = 0
    var newType = true
    var numberInputed = false
    var hasDot = false
    
    @IBOutlet weak var Display: UILabel!
    @IBAction func Numbers(_ sender: UIButton) {
        if newType == true || Display.text == "0" {
            Display.text = ""
            newType = false
        }
        Display.text = Display.text! + String(sender.tag - 1)
        if doingMath {
            latterNumber = Double(Display.text!)!
        }else{
            previousNumber = Double(Display.text!)!
        }
        numberInputed = true
    }

    @IBAction func Functions(_ sender: UIButton) {
        Operate: if Display.text != "" && sender.tag != 11 && sender.tag != 12 && sender.tag != 13 && sender.tag != 18 && sender.tag != 19{
            if sender.tag == 14 //Divide
            {
                Display.text = "÷"
                if doingMath && numberInputed {
                    if operation == 14 {
                        if latterNumber == 0{
                            Display.text = "Error"
                            break Operate
                        }else{
                            Result = previousNumber / latterNumber
                        }
                    }else if operation == 15 {
                        Result = previousNumber * latterNumber
                    }else if operation == 16 {
                        Result = previousNumber - latterNumber
                    }else if operation == 17 {
                        Result = previousNumber + latterNumber
                    }
                    previousNumber = Result
                    if Result == Double(Int(Result)){
                        Display.text = String(Int(Result))
                    }else{
                        Display.text = String(Result)
                    }
                }
            }else if sender.tag == 15 //Multiply
            {
                Display.text = "×"
                if doingMath && numberInputed {
                    if operation == 14 {
                        Result = previousNumber / latterNumber
                    }else if operation == 15 {
                        Result = previousNumber * latterNumber
                    }else if operation == 16 {
                        Result = previousNumber - latterNumber
                    }else if operation == 17 {
                        Result = previousNumber + latterNumber
                    }
                    previousNumber = Result
                    if Result == Double(Int(Result)){
                        Display.text = String(Int(Result))
                    }else{
                        Display.text = String(Result)
                    }
                }
            }else if sender.tag == 16 //Minus
            {
                Display.text = "−"
                if doingMath && numberInputed {
                    if operation == 14 {
                        Result = previousNumber / latterNumber
                    }else if operation == 15 {
                        Result = previousNumber * latterNumber
                    }else if operation == 16 {
                        Result = previousNumber - latterNumber
                    }else if operation == 17 {
                        Result = previousNumber + latterNumber
                    }
                    previousNumber = Result
                    if Result == Double(Int(Result)){
                        Display.text = String(Int(Result))
                    }else{
                        Display.text = String(Result)
                    }
                }
            }else if sender.tag == 17 //Plus
            {
                Display.text = "+"
                if doingMath && numberInputed {
                    if operation == 14 {
                        Result = previousNumber / latterNumber
                    }else if operation == 15 {
                        Result = previousNumber * latterNumber
                    }else if operation == 16 {
                        Result = previousNumber - latterNumber
                    }else if operation == 17 {
                        Result = previousNumber + latterNumber
                    }
                    previousNumber = Result
                    if Result == Double(Int(Result)){
                        Display.text = String(Int(Result))
                    }else{
                        Display.text = String(Result)
                    }
                }
            }
            operation = sender.tag
            doingMath = true
            newType = true
            hasDot = false
        }else if sender.tag == 18 //Equal
        {
            if operation == 14 {
                if latterNumber == 0{
                    Display.text = "Error"
                    break Operate
                }else{
                    Result = previousNumber / latterNumber
                }
            }else if operation == 15 {
                Result = previousNumber * latterNumber
            }else if operation == 16 {
                Result = previousNumber - latterNumber
            }else if operation == 17 {
                Result = previousNumber + latterNumber
            }
            if operation == 0{
                Result = previousNumber
            }else{
                previousNumber = Result
            }
            if Result == Double(Int(Result)){
                Display.text = String(Int(Result))
            }else{
                Display.text = String(Result)
            }
            doingMath = false
            newType = true
            hasDot = false
        }else if sender.tag == 11{
            Result = 0
            previousNumber = 0
            latterNumber = 0
            operation = 0
            Display.text = "0"
            newType = true
            doingMath = false
            hasDot = false
        }else if sender.tag == 19{
            if !hasDot && Display.text != "" && !newType {
                Display.text = Display.text! + "."
                hasDot = true
            }
        }else if sender.tag == 13{
            if Display.text != "0" && Display.text != "Error" && !(!doingMath && Result != 0) {
                if Display.text?.characters.count != 1 {
                    Display.text?.remove(at: (Display.text?.index(before: (Display.text?.endIndex)!))!)
                }else{
                    Display.text = "0"
                }
                if doingMath {
                    latterNumber = Double(Display.text!)!
                }else{
                    previousNumber = Double(Display.text!)!
                }
            }else if (!doingMath && Result != 0) || Display.text == "Error"{
                Result = 0
                previousNumber = 0
                latterNumber = 0
                operation = 0
                Display.text = "0"
                newType = true
                doingMath = false
                hasDot = false
            }
        }else if sender.tag == 12{
            let temp: Double = Double(String(Double(Display.text!)! - 2 * Double(Display.text!)!))!
            if temp == Double(Int(temp)) {
                Display.text = String(Int(temp))
            }else{
                Display.text = String(temp)
            }
            if doingMath {
                latterNumber = Double(Display.text!)!
            }else{
                previousNumber = Double(Display.text!)!
            }
        }
        numberInputed = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

