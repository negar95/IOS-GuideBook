//
//  RegisterController.swift
//  moshaverketab
//
//  Created by negar on 96/Shahrivar/16 AP.
//  Copyright © 1396 negar. All rights reserved.
//


import UIKit

class RegisterController {
    
    
    func isAlphabatic(Input:String) -> Bool {
        let myCharSet = CharacterSet( charactersIn: "ابپتثجچحخدذرزژسشصضطظعغفقکگلمنوهی ّةآأإيئؤكءًٌٍَُِ")
        let output: String = Input.trimmingCharacters(in: myCharSet.inverted)
        
        let spaceSet = CharacterSet( charactersIn: " ")
        let justSpace: String = Input.trimmingCharacters(in: spaceSet.inverted)
        
        
        let isValid: Bool = (Input == output) && (Input != justSpace)
        
        return isValid
    }
    
    func isNumeric(Input:String) -> Bool {
        let myCharSet=CharacterSet(charactersIn:"0123456789")
        let output: String = Input.trimmingCharacters(in: myCharSet.inverted)
        let isValid: Bool = (Input == output)
        
        return isValid
    }
    
    func countLowLimit(count : Int) -> Bool { return (count == 1)}
    func countHighLimit(count : Int) -> Bool { return (count > 20)}
    func nationalCodeLimit(count : Int) -> Bool { return !((count == 10)||(count == 0))}
    func numberLimit(count : Int) -> Bool { return !((count == 9)||(count == 0))}
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
