//
//  RegisterView.swift
//  moshaverketab
//
//  Created by negar on 96/Shahrivar/12 AP.
//  Copyright © 1396 negar. All rights reserved.
//

import UIKit

class RegisterView: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource{

    let controller = RegisterController()
    let user = User()
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var nationalCodeTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var townTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var firstNameErrLabel: UILabel!
    @IBOutlet weak var lastNameErrLabel: UILabel!
    @IBOutlet weak var nationalCodeErrLabel: UILabel!
    @IBOutlet weak var numberErrLabel: UILabel!
    @IBOutlet weak var townErrlabel: UILabel!
    @IBOutlet weak var stateErrlabel: UILabel!
    
    @IBOutlet weak var buttImg: UIImageView!
    
    @IBOutlet weak var bookCheckBox: UIButton!
    @IBOutlet weak var testCheckBox: UIButton!
    
    @IBOutlet weak var degreeCam: UIButton!
    @IBOutlet weak var degreeFile: UIButton!
    
    @IBOutlet weak var natCam: UIButton!
    @IBOutlet weak var natFile: UIButton!
    
    @IBOutlet weak var degreeUpload: UIButton!
    @IBOutlet weak var nationalUpload: UIButton!
    
    @IBOutlet weak var natButtImg: UIImageView!
    @IBOutlet weak var degButtImg: UIImageView!
    
    
    @IBOutlet weak var imgPreview: UIImageView!
    
    @IBOutlet weak var saveImg: UIButton!
    
    var states = [String]()
    var towns = [String]()

    var statesPicker : UIPickerView!
    var towsPicker : UIPickerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)

        
        states.append("تهران")
        states.append("گیلان")
        states.append("کردستان")

        
        buttImg.image = #imageLiteral(resourceName: "submitButt")
        
        bookCheckBox.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        bookCheckBox.setImage(#imageLiteral(resourceName: "checked"), for: .selected)
        
        testCheckBox.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        testCheckBox.setImage(#imageLiteral(resourceName: "checked"), for: .selected)
        
        degreeCam.setImage(#imageLiteral(resourceName: "cam"), for: .normal)
        degreeFile.setImage(#imageLiteral(resourceName: "open"), for: .normal)
        
        natCam.setImage(#imageLiteral(resourceName: "cam"), for: .normal)
        natFile.setImage(#imageLiteral(resourceName: "open"), for: .normal)
        
        degreeCam.isHidden = true
        degreeFile.isHidden = true
        
        natCam.isHidden = true
        natFile.isHidden = true
        
        natButtImg.image = #imageLiteral(resourceName: "natButt")
        degButtImg.image = #imageLiteral(resourceName: "degreeButt")
        
        saveImg.isHidden = true
        
        townTextField.isEnabled = false
        
        taggingTextFields()
        delegateTextFields()
        
        nationalCodeTextField.keyboardType = UIKeyboardType.numberPad
        numberTextField.keyboardType = UIKeyboardType.numberPad
        
        statesPicker = UIPickerView()
        statesPicker.delegate = self
        statesPicker.dataSource = self
        statesPicker.backgroundColor = UIColor(red: 53/255, green: 85/255, blue: 18/255, alpha: 0.7)
        
        stateTextField.inputView = statesPicker
        
        towsPicker = UIPickerView()
        towsPicker.delegate = self
        towsPicker.dataSource = self
        towsPicker.backgroundColor = UIColor(red: 53/255, green: 85/255, blue: 18/255, alpha: 0.7)
        
        townTextField.inputView = towsPicker
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.view.isUserInteractionEnabled = true
        self.view.addGestureRecognizer(tapGesture)
        
    }

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        
        if pickerView == statesPicker {
            let title = NSAttributedString(string: states[row] , attributes: [NSForegroundColorAttributeName : UIColor.white])
            return title
        } else {
            let title = NSAttributedString(string: towns[row] , attributes: [NSForegroundColorAttributeName : UIColor.white])
            return title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == statesPicker {
            stateTextField.text = states[row]
            townTextField.isEnabled = true
        } else if pickerView == towsPicker {
            townTextField.text = towns[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == statesPicker {
            return states.count
        }else{
            return towns.count
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func handleTap(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func bookGuideSelect(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func testGuideSelect(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    
    @IBAction func degreeSelect(_ sender: UIButton) {
        sender.isHidden = true
        degButtImg.isHidden = true
        
        degreeCam.isHidden = false
        degreeFile.isHidden = false
    }
    
    @IBAction func nationalCardSelect(_ sender: UIButton) {
        sender.isHidden = true
        natButtImg.isHidden = true
        
        natCam.isHidden = false
        natFile.isHidden = false
    }
    
    @IBAction func degreeCameraSelect(_ sender: UIButton) {
        degreeUpload.isHidden = false
        degButtImg.isHidden = false
        
        degreeCam.isHidden = true
        degreeFile.isHidden = true
        
        cameraPicker()
    }
    
    @IBAction func degreeFileSelect(_ sender: UIButton) {
        degreeUpload.isHidden = false
        degButtImg.isHidden = false
        
        degreeCam.isHidden = true
        degreeFile.isHidden = true
        
        libraryPicker()
    }
    
    @IBAction func nationalCardCameraSelect(_ sender: UIButton) {
        nationalUpload.isHidden = false
        natButtImg.isHidden = false
        
        natCam.isHidden = true
        natFile.isHidden = true
        
        cameraPicker()
    }
    
    @IBAction func nationalCardFileSelect(_ sender: UIButton) {
        nationalUpload.isHidden = false
        natButtImg.isHidden = false
        
        natCam.isHidden = true
        natFile.isHidden = true
        
        libraryPicker()
    }
    
    
    func cameraPicker() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func libraryPicker() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true

            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        imgPreview.image = image
        
        saveImg.isHidden = false
        dismiss(animated:true, completion: nil)
    }
    
    @IBAction func sexEnter(_ sender: UIButton) {
        
        let refreshAlert = UIAlertController(title: "جنسیت", message: "لطفا جنسیت خود راانتخاب کنید.", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "زن", style: .default, handler: { (action: UIAlertAction!) in
            sender.setTitle("زن", for: .normal)

        }))
        
        refreshAlert.addAction(UIAlertAction(title: "مرد", style: .default, handler: { (action: UIAlertAction!) in
            sender.setTitle("مرد", for: .normal)

        }))
        
        self.present(refreshAlert, animated: true, completion: nil)
    }
    
    @IBAction func jobEnter(_ sender: UIButton) {
        let refreshAlert = UIAlertController(title: "شغل", message: "لطفا شغل خود راانتخاب کنید.", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "پشتیبان", style: .default, handler: { (action: UIAlertAction!) in
            sender.setTitle("پشتیبان", for: .normal)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "مدیر", style: .default, handler: { (action: UIAlertAction!) in
            sender.setTitle("مدیر", for: .normal)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "دبیر", style: .default, handler: { (action: UIAlertAction!) in
            sender.setTitle("دبیر", for: .normal)
            
        }))
        
        self.present(refreshAlert, animated: true, completion: nil)
    }
    
    @IBAction func degreeEnteer(_ sender: UIButton) {
        
        let refreshAlert = UIAlertController(title: "مدرک", message: "لطفا مدرک خود راانتخاب کنید.", preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: "کارشناسی", style: .default, handler: { (action: UIAlertAction!) in
            sender.setTitle("کارشناسی", for: .normal)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "کارشناسی ارشد", style: .default, handler: { (action: UIAlertAction!) in
            sender.setTitle("کارشناسی ارشد", for: .normal)
            
        }))
        
        refreshAlert.addAction(UIAlertAction(title: "دکترا", style: .default, handler: { (action: UIAlertAction!) in
            sender.setTitle("دکترا", for: .normal)
            
        }))
        
        self.present(refreshAlert, animated: true, completion: nil)
    }
    
    
    func alphabaticError(textField : UITextField,errLabel : UILabel, errText : String) {
        if controller.isAlphabatic(Input: textField.text!) == false {
            
            errLabel.text = errText + "از حروف تشکیل شده است."
            shake(textField: textField)
        } else{
            errLabel.text = ""
        }
        
        if (textField.text?.characters.count == 0){
            errLabel.text = "پر کردن این فیلد اجباریست."
            shake(textField: textField)
        }
    }
    
    func numericError(textField : UITextField, errLabel : UILabel, errText : String) {
        if controller.isNumeric(Input: textField.text!) == false {
            errLabel.text = errText + "از اعداد تشکیل شده است."
            shake(textField: textField)

        } else{
            errLabel.text = ""
        }
        
        if (textField.text?.characters.count == 0){
            errLabel.text = "پر کردن این فیلد اجباریست."
            shake(textField: textField)
        }
    }
    
    func lowLimit(textField : UITextField, errLabel : UILabel, errText : String) {
        if controller.countLowLimit(count: (textField.text?.characters.count)!) {
            errLabel.text = errText + "حداقل ۲ حرف دارد."
            shake(textField: textField)

        }
    }
    
    func highLimit(textField : UITextField, errLabel : UILabel, errText : String) {
        if controller.countHighLimit(count: (textField.text?.characters.count)!) {
            errLabel.text = errText + "حداکثر ۲۰ حرف دارد."
            shake(textField: textField)

        }
    }
    
    func nationalCodeChar(textField : UITextField, errLabel : UILabel) {
        if controller.nationalCodeLimit(count: (textField.text?.characters.count)!) {
            errLabel.text = "کد ملی ۱۰ رقمی است."
            shake(textField: textField)

        }
    }
    
    func numberChar(textField : UITextField, errLabel : UILabel) {
        if controller.numberLimit(count: (textField.text?.characters.count)!) {
            errLabel.text = "شماره ۱۱ رقمی است."
            shake(textField: textField)

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
    
    func taggingTextFields() {
        firstNameTextField.tag = 0
        lastNameTextField.tag = 1
        nationalCodeTextField.tag = 2
        numberTextField.tag = 3
        townTextField.tag = 4
        stateTextField.tag = 5
    }
    
    func delegateTextFields() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        nationalCodeTextField.delegate = self
        numberTextField.delegate = self
        townTextField.delegate = self
        stateTextField.delegate = self

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    @IBAction func submit(_ sender: UIButton) {
        
        self.alphabaticError(textField: firstNameTextField, errLabel: firstNameErrLabel, errText: "نام ")
        self.alphabaticError(textField: lastNameTextField, errLabel: lastNameErrLabel, errText: "نام خانوادگی ")
        self.numericError(textField: nationalCodeTextField, errLabel: nationalCodeErrLabel, errText: "کد ملی ")
        self.numericError(textField: numberTextField, errLabel: numberErrLabel, errText: "شماره ")
        self.alphabaticError(textField: townTextField, errLabel: townErrlabel, errText: "شهر ")
        self.alphabaticError(textField: stateTextField, errLabel: stateErrlabel, errText: "استان ")
        
        self.lowLimit(textField: firstNameTextField, errLabel: firstNameErrLabel, errText: "نام ")
        self.lowLimit(textField: lastNameTextField, errLabel: lastNameErrLabel, errText: "نام خانوادگی ")
        self.lowLimit(textField: townTextField, errLabel: townErrlabel, errText: "شهر ")
        
        self.highLimit(textField: firstNameTextField, errLabel: firstNameErrLabel, errText: "نام ")
        self.highLimit(textField: lastNameTextField, errLabel: lastNameErrLabel, errText: "نام خانوادگی ")
        self.highLimit(textField: townTextField, errLabel: townErrlabel, errText: "شهر ")
        
        self.nationalCodeChar(textField: nationalCodeTextField, errLabel: nationalCodeErrLabel)
        
        self.numberChar(textField: numberTextField, errLabel: numberErrLabel)
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
