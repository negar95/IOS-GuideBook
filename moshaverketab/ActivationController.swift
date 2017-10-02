//
//  ActivationController.swift
//  moshaverketab
//
//  Created by negar on 96/Shahrivar/16 AP.
//  Copyright © 1396 negar. All rights reserved.
//

import UIKit

class ActivationController {
    
    func isNumeric(Input:String) -> Bool {
        let myCharSet=CharacterSet(charactersIn:"0123456789")
        let output: String = Input.trimmingCharacters(in: myCharSet.inverted)
        let isValid: Bool = (Input == output)
        
        return isValid
    }
    
    func countLimit(count : Int) -> Bool { return !((count == 5)||(count == 0))}
    
}
