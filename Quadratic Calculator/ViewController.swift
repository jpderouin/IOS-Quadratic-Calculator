//
//  ViewController.swift
//  Quadratic Calculator
//
//  Created by Jake Derouin on 6/24/18.
//  Copyright © 2018 Jake Derouin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
    @IBOutlet weak var a: UITextField!
    @IBOutlet weak var b: UITextField!
    @IBOutlet weak var c: UITextField!
    @IBOutlet weak var step4: UILabel!
    @IBOutlet weak var step1: UILabel!
    @IBOutlet weak var step2: UILabel!
    @IBOutlet weak var step3: UILabel!
    @IBOutlet weak var yourequation: UILabel!
    @IBOutlet weak var answer: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        a.delegate = self
           b.delegate = self
           c.delegate = self
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        a.resignFirstResponder()
          b.resignFirstResponder()
          c.resignFirstResponder()
        return true
    }
    
    var avalue: Double?
    var bvalue: Double?
    var cvalue: Double?
    var band4ac: Double?
    var plusanswer: Double?
    var minusanswer: Double?
    var dashes = (number: 0, text: "-")
    var dashestoadd = ""
    func checkforavalueerror(value: Double)->Bool{
        if(value==0.0){
            return true
        }else{
            return false
        }
    }
    
   

    
    @IBAction func calculate(_ sender: UIButton) {
        a.resignFirstResponder()
        b.resignFirstResponder()
        c.resignFirstResponder()
        if (a.text == ""||b.text == "" || c.text == ""){
            let alert = UIAlertController(title: "Invalid input", message:"Please don't leave any fields blank.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Got it!", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        
        }else{
        
        yourequation.text = ""
        dashestoadd=""
        dashes.number=0
        avalue = Double(a.text!)
      bvalue = Double(b.text!)
        cvalue = Double(c.text!)
        yourequation.text = "-\(bvalue!)±√(\(bvalue!)^2-4*\(avalue!)*\(cvalue!))"
       dashes.number=yourequation.text!.count
        
        
        for _ in 1...dashes.number{
        dashestoadd = dashestoadd+"-"
            
           
        }
        yourequation.text = "\(yourequation.text!)" + "\n\(dashestoadd)\n2*\(avalue!)"
        
        
        step1.text = "Step 1: Take the opposite of the b value: \(bvalue!) becomes \(bvalue! * -1): \(bvalue! * -1)±√(\(bvalue!)^2-4\(avalue!)*\(cvalue!))"
        step1.text = step1.text! + "\n\(dashestoadd)\n2*\(avalue!): "
        step2.text = "Step 2: Now square the b value inside the square root and multiply 4 times a times c:  \(bvalue!) becomes \(pow(bvalue!, 2)) and 4*\(avalue!)*\(cvalue!) becomes \(4*avalue!*cvalue!):\n \(bvalue! * -1)±√(\(pow(bvalue!, 2))-\(4*avalue!*cvalue!))"
        band4ac = pow(bvalue!, 2)-(4*avalue!*cvalue!)
        step2.text = step2.text! + "\n\(dashestoadd)\n2*\(avalue!)"
        
        step3.text = "Step 3: Now combine the two numbers inside the square root and take the square root of the difference: : \(pow(bvalue!, 2))-\(4*avalue!*cvalue!) becomes \(band4ac!) and by square rooting it you get \(sqrt(band4ac!)):\n\(bvalue! * -1)±\(sqrt(band4ac!))"
        step3.text = step3.text! + "\n\(dashestoadd)\n2*\(avalue!)"
        step4.text = "Step 4: Solve the remaining equation.  Add \(bvalue! * -1) to \(sqrt(band4ac!)) and get \((bvalue! * -1)+sqrt(band4ac!)) next divide by \(2 * avalue!) and get \(((bvalue! * -1)+sqrt(band4ac!))/(2 * avalue!)) now repeat but by subtracting \(bvalue! * -1) and \(sqrt(band4ac!)) and get \(((bvalue! * -1)-sqrt(band4ac!))/(2 * avalue!))"
       
        
        answer.text = "Your answers are \(((bvalue! * -1)+sqrt(band4ac!))/(2 * avalue!)) and \(((bvalue! * -1)-sqrt(band4ac!))/(2 * avalue!))"
        
        
        
     

        
        
     
      
    
    
    



    }
    }}

