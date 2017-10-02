//
//  BookBuyingView.swift
//  moshaverketab
//
//  Created by negar on 96/Shahrivar/22 AP.
//  Copyright © 1396 negar. All rights reserved.
//

import UIKit

class BookBuyingView: UIViewController {

    @IBOutlet weak var percent: UITextField!
    @IBOutlet weak var percentErrLabel: UILabel!
    
    var controller = BookBuyingController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(_ sender: UIButton) {
        percentErr(textField: percent, label: percentErrLabel)
    }

    func percentErr(textField : UITextField, label : UILabel) {
        
        if (controller.isEmpty(count: (textField.text?.characters.count)!)){
            shake(textField: textField)
            label.text = "لطفا درصد تخفیف را وارد کنید."
        }else if(controller.percentageIsOverLimit(count: (textField.text?.characters.count)!)){
            shake(textField: textField)
            label.text = "عدد درصد را بین ۰-۹۹ وارد کنید."
        }else if(!controller.isNumeric(Input: textField.text!)){
            shake(textField: textField)
            label.text = "لطفا عدد وارد کنید."
        }else{
            label.text = ""
        }
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
