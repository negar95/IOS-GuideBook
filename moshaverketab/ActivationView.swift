//
//  ActivationView.swift
//  moshaverketab
//
//  Created by negar on 96/Shahrivar/14 AP.
//  Copyright © 1396 negar. All rights reserved.
//

import UIKit

class ActivationView: UIViewController {
    
    let controller = ActivationController()
    
    @IBOutlet weak var activationCodeTextField: UITextField!
    @IBOutlet weak var activationCodeErrLabel: UILabel!
    
    @IBOutlet weak var sendAgainButtView: UIButton!
    
    @IBOutlet weak var spinnerLabel: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    @IBOutlet weak var buttImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        activationCodeTextField.keyboardType = UIKeyboardType.numberPad
        
        buttImg.image = #imageLiteral(resourceName: "enterButt")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tapGesture)

        spinner.hidesWhenStopped = true
        spinner.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(spinner)
        spinner.startAnimating()

        sendAgainButtView.isEnabled = false
        spinnerLabel.text="چند لحظه صبر کنید."


        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        sleep(3)
        
        sendAgainButtView.isEnabled = true
        spinnerLabel.text = ""
        spinner.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func activationCodeEnter(_ sender: Any) {
        self.numericError(textField: activationCodeTextField, errLabel: activationCodeErrLabel)
        self.limitCheck(textField: activationCodeTextField, errLabel: activationCodeErrLabel)
    }
    
    @IBAction func sendAgainEnter(_ sender: UIButton) {

        
        sleep(3)
        
        self.sendAgainButtView.isEnabled = true
        self.spinnerLabel.text = ""
        self.spinner.stopAnimating()
        
        
    }
    
    @IBAction func sendAgainDown(_ sender: UIButton) {
        self.sendAgainButtView.isEnabled = false
        self.spinnerLabel.text = "چند لحظه صبر کنید."
        self.spinner.isHidden = false
        self.spinner.startAnimating()
    }
    
    
    func shake(textField : UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }
    
    func numericError(textField : UITextField, errLabel : UILabel) {
        if controller.isNumeric(Input: textField.text!) == false {
            errLabel.text =  "لطفا عدد وارد کنید."
            shake(textField: textField)
            
        } else{
            errLabel.text = ""
        }
        
        if (textField.text?.characters.count == 0){
            errLabel.text = "پر کردن این فیلد اجباریست."
            shake(textField: textField)
        }
    }
    
    func limitCheck(textField : UITextField, errLabel : UILabel) {
        if controller.countLimit(count: (textField.text?.characters.count)!) {
            errLabel.text = "کد فعالسازی ۵ رقمی است."
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
