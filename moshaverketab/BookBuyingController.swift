//
//  BookBuyingController.swift
//  moshaverketab
//
//  Created by negar on 96/Shahrivar/22 AP.
//  Copyright © 1396 negar. All rights reserved.
//
import UIKit

class BookBuyingController {
    
    func isNumeric(Input:String) -> Bool {
        let myCharSet=CharacterSet(charactersIn:"0123456789")
        let output: String = Input.trimmingCharacters(in: myCharSet.inverted)
        let isValid: Bool = (Input == output)
        
        return isValid
    }
    
    func percentageIsOverLimit(count : Int) -> Bool {return !(count<3&&count>0) }
    
    func isEmpty(count : Int) -> Bool {return (count==0)}

}
