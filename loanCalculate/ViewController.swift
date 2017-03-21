//
//  ViewController.swift
//  loanCalculate
//
//  Created by 上海海洋大学 on 17/3/21.
//  Copyright © 2017年 上海海洋大学. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loanAmountField: UITextField!
    @IBOutlet weak var loanTermField: UITextField!
    @IBOutlet weak var interestRateField: UITextField!
    @IBOutlet weak var result: UILabel!
    @IBAction func Calculate(_ sender: Any)
            {
        let calculate1 = simpleCalculate()
        result.text = calculate1.calculate(loanAmount:Double(loanAmountField.text!)!,years:Int(loanTermField.text!)!,interestRate:Double(interestRateField.text!)!).description
    }
    @IBAction func compound(_ sender: Any) {
        let calculate2 = compoundCalculate()
        result.text = calculate2.calculate(loanAmount:Double(loanAmountField.text!)!,years:Int(loanTermField.text!)!,interestRate:Double(interestRateField.text!)!).description
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
class simpleCalculate{
    func calculate(loanAmount:Double,years:Int,interestRate:Double)->Double{
    let rate = interestRate / 100
    let interest = loanAmount * rate * Double(years)
    return loanAmount + interest
    }
}

class compoundCalculate{
    func calculate(loanAmount:Double,years:Int,interestRate:Double)->Double{
        let rate = interestRate / 100
        let compoundInterest = pow(1.0+rate,Double(years))
        return compoundInterest * loanAmount
    }
}
