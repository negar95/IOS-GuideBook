//
//  TestView.swift
//  moshaverketab
//
//  Created by negar on 96/Shahrivar/17 AP.
//  Copyright © 1396 negar. All rights reserved.
//

import UIKit

class TestView: UIViewController {

    @IBOutlet weak var testStatusLabel: UILabel!
    @IBOutlet weak var markLabel: UILabel!
    @IBOutlet weak var advicerStatus: UILabel!
    
    @IBOutlet weak var op1: UIButton!
    @IBOutlet weak var op2: UIButton!
    @IBOutlet weak var op3: UIButton!
    @IBOutlet weak var op4: UIButton!
    
    @IBAction func konkoorTestButt(_ sender: UIButton) {
        testStatusLabel.text = "آزمون مقطع کنکور"
    }
    
    @IBAction func mot2TestButt(_ sender: UIButton) {
        testStatusLabel.text = "آزمون مقطع متوسطه ۲"

    }
    
    @IBAction func mot1TestButt(_ sender: UIButton) {
        testStatusLabel.text = "آزمون مقطع متوسطه ۱"

    }
    
    @IBAction func dabestanTestButt(_ sender: UIButton) {
        testStatusLabel.text = "آزمون مقطع دبستان"

    }
    
    
    @IBAction func option1Enter(_ sender: UIButton) {
        //
    }
    
    @IBAction func option2Enter(_ sender: UIButton) {
    }
    
    @IBAction func option3Enter(_ sender: UIButton) {
    }
    
    @IBAction func option4Enter(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
