//
//  ViewController.swift
//  SharonCalculator
//
//  Created by ilabadmin on 2/03/17.
//  Copyright © 2017 Strathmore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet var lblDisplay: UILabel!
    
    
    
    var isUserTyping :Bool=false
    
    var model:calculatorModel=calculatorModel()
    
    var displayValue:Double{
        get{
            return Double(lblDisplay.text!)!
        }
        set{
            lblDisplay.text=String(newValue)
        }
        
    }
    
    
    @IBAction func digitTouched(sender: UIButton) {
        
        
        let digit = sender.currentTitle!
        
        if (isUserTyping==true){
            let textDisplaying = lblDisplay.text!
            lblDisplay.text = (digit == "." && textDisplaying.rangeOfString(".") != nil) ? textDisplaying : textDisplaying + digit
        }
            
        else{
            lblDisplay.text = (digit == ".") ? "0." : digit
        }
        
        
        isUserTyping=true
    }
    
    
    
    
    @IBAction func performedOperation(sender: AnyObject) {
        
        
        
        if isUserTyping {
            model.getOperands(displayValue)
            isUserTyping=false
        }
        
        if let matsymbol=sender.currentTitle! {
            model.performOperation(matsymbol)
        }
        
        displayValue=model.result
        
        
        /*let matSymbol=sender.currentTitle!
         switch matSymbol {
         case "∏":
         displayValue=M_PI
         case "√":
         displayValue=sqrt(displayValue)
         default:
         break
         
         }*/
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

