//
//  ViewController.swift
//  Numbersaver
//
//  Created by Uday Kiran Reddy Vatti on 2/9/16.
//  Copyright (c) 2016 Uday Kiran Reddy Vatti. All rights reserved.
//


// Team Members:
// Uday Kiran Reddy Vatti - z1780468
// Sreya Nooli - z1781925

import UIKit

class ViewController: UIViewController , UITextFieldDelegate {
  
    
    
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var sliderOne: UISlider!
    @IBOutlet weak var numberTextField: UITextField!
    
    
    @IBOutlet weak var size: UILabel!
    @IBOutlet weak var sliderTwo: UISlider!
    @IBOutlet weak var labelTwo: UILabel!
    
        var number : Double = 0.0
    var amount:Double = 0.0
     var tipAmount: Double = 0.0
    var global: Double = 0.0
    
    
    @IBAction func sliderPercent(sender: AnyObject) {
        var sliderValue: Float
        sliderOne.minimumValue = 0
        sliderOne.maximumValue = 40
        
        
        sliderValue = sliderOne.value
        percent.text = "\(sliderValue)%"
        let amount = numberTextField.text
        numberTextField.resignFirstResponder()
        
        if let temp = amount.toDouble(){
            number = temp
            
            var calP : Double = 0.0
            
            calP = number*Double(sliderValue/100)
            
            calP = calP + number
            
           
            
            labelOne.text = "$\(calP)"
        
    }
        
        
    }
    
    
    
    @IBAction func sliderSize(sender: AnyObject) {
        
        var final: Double = 0.0
        sliderTwo.minimumValue = 1
        sliderTwo.maximumValue = 10
        var number = Int(sliderTwo.value)
        size.text = "\(number)"
        if final > 0 {
            numberTextField.resignFirstResponder()
            let t = final
            let num = Double(number)
            //var y : Double = 0.0
            let y = t / num
            let x = Double(round(100*y)/100)
            labelTwo.text = "$\(x)"
        }
        else
        {
            var x:Double = 0.0
            numberTextField.resignFirstResponder()
            let amt = numberTextField.text
            //var y:Double = 0.0
            final = (amt as NSString).doubleValue
            let y = final
            if y > 0{
                let num = Double(number)
                x  = y / num
                x = Double(round(100*x)/100)
            }else{
                println("Error in taking value ")
            }
            labelTwo.text = "$\(x)"
            
        }
        
    }
        
        
        
        
        
        
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //
    // Respond to Return Key being pressed
    //
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        // 1. Get text from text field as String
        let numberString = textField.text
        
        // 2. Try to convert String to Int
        if let numberFromString = numberString.toDouble()
        {
        number = numberFromString
        println(" This number is \(numberFromString)")
        }
        else {
            println(" Error: Not a Number")
        }
        
     return true
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        // 1. Get text from text field as String
        let numberString = textField.text
        
        // 2. Try to convert String to Int
        if let numberFromString = numberString.toDouble()
        {
            number = numberFromString
            /*
            let alertController = UIAlertController(title: "Success", message: " The number is \(numberFromString)", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            
            alertController.addAction(cancelAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            */
            
        }
        else {
            
            let alertController = UIAlertController(title: "Error", message: " Please enter a valid number", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            
            alertController.addAction(cancelAction)
         
            self.presentViewController(alertController, animated: true, completion: nil)
            
            println("Error: not a number")
            
            
            
        }
    
     return true
        
    }
    
    
    @IBAction func backgroundTouc(sender: UIControl) {
        
        numberTextField.resignFirstResponder()
        
    }


}

