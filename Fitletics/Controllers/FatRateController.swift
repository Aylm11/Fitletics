//
//  FatRateController.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 23.07.2022.
//

import Foundation
import UIKit


class FatRateController : UIViewController, UIPickerViewDelegate {
    
    //MARK: -PROPERTIES
    
    private let genders = ["Male", "Female"]
    
    private let infoLabel : UILabel = {
       let label = UILabel()
        label.text = "Your Fat Rate: "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .lightGray
        return label
    }()
    
    private let heightTextField : UITextField = {
        let tf = CustomTextField(placeholder: "Height (CM)")
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let neckTextField : UITextField = {
        let tf = CustomTextField(placeholder: "Neck")
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let weightTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Weight (KG)")
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let waistTextField : UITextField = {
        let tf = CustomTextField(placeholder: "Waist")
        
        
        return tf
    }()
    
    private let genderTextField : UITextField = {
        let gtf = CustomTextField(placeholder: "Gender")
        
        let uv = UIView()
        let iv = UIImageView()
        let spacer = UIView()
        uv.setDimensions(height: 20, width: 30)
        iv.setDimensions(height: 20, width: 20)
        spacer.setDimensions(height: 20, width: 4)
        
        iv.image = UIImage(named: "down")?.withTintColor(.white)
        uv.addSubview(spacer)
        uv.addSubview(iv)
        
        spacer.centerY(inView: uv)
        spacer.anchor(left: iv.rightAnchor, paddingLeft: 2)
        iv.centerY(inView: uv)
        iv.anchor(right: spacer.leftAnchor, paddingRight: 4)
        
        gtf.rightView = uv
        gtf.rightViewMode = .always
        
        
        return gtf
    }()
    
    private let calculateButton : UIButton = {
        let button = UIButton(type: .system)
        button.setDimensions(height: 60, width: 180)
        button.addTarget(self, action: #selector(handleCalculate), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "calcbutton"), for: .normal)
        return button
    }()
    
    private let grayContainer: UIView = {
        let uv = UIView()
        uv.setDimensions(height: 100, width: UIScreen.main.bounds.width)
        uv.backgroundColor = UIColor(named: "customgray")
        return uv
    }()
    
    private let bodyFatLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
        
        
    }()
    
    private let resultButton : UIButton = {
        let button = UIButton(type: .system)
        button.setDimensions(height: 60, width: 220)
        button.addTarget(self, action: #selector(handleShowResult), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "result"), for: .normal)
        return button
    }()
    
    
    //MARK: -LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureGenderDropdown()
        
    }
    
    //MARK: -ACTIONS
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    @objc func handleCalculate() {
        let height = Double(heightTextField.text!)
        let weight =  Double(weightTextField.text!)
        let waist = Double(waistTextField.text!)
        let neck = Double(neckTextField.text!)
        
        if waistTextField.text?.isEmpty == false && genderTextField.text?.isEmpty == false && heightTextField.text?.isEmpty == false && weightTextField.text?.isEmpty == false && neckTextField.text?.isEmpty == false {
       
        
        if genderTextField.text == "Male" {
            let bf = 10.1 - (0.239 * height!) + (0.8 * waist!) - (0.5 * neck!)
            bodyFatLabel.text = "%\(Int(bf))"
        }else {
            let bf = 19.2 - (0.239 * height!) + (0.8 * waist!) - (0.5 * neck!)
            bodyFatLabel.text = "%\(Int(bf))"
        }
        } else {
            showMessage(withTitle: "Fill the all fields.", message: "There are empty fields.")
        }
    }
    
    @objc func handleShowResult(){
        present(FatRateDetailsController(), animated: true, completion: nil)
    }
    
    //MARK: -HELPERS
    
    func configureUI(){
        
        
        navigationController?.navigationBar.topItem?.hidesBackButton = true
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .black
        let logo = UIImage(named: "fitlogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
      
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor,UIColor(red: 96, green: 96, blue: 96, alpha: 100) ]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 36, paddingLeft: 12)
        
        let stackViewLeft = UIStackView(arrangedSubviews: [heightTextField, neckTextField])
        stackViewLeft.axis = .vertical
        stackViewLeft.spacing = 15
        
        
        let stackViewRight = UIStackView(arrangedSubviews: [weightTextField, waistTextField])
        stackViewRight.axis = .vertical
        stackViewRight.spacing = 15
        
        view.addSubview(stackViewLeft)
        stackViewLeft.anchor(top: infoLabel.bottomAnchor,left:view.leftAnchor,paddingTop: 20, paddingLeft: 10)
        
        
        view.addSubview(stackViewRight)
        stackViewRight.anchor(top: infoLabel.bottomAnchor,right: view.rightAnchor,paddingTop: 20,paddingRight: 10)
        
        view.addSubview(genderTextField)
        genderTextField.centerX(inView: view)
        genderTextField.anchor(top:stackViewLeft.bottomAnchor, paddingTop: 12)
        
        view.addSubview(calculateButton)
        calculateButton.centerX(inView: view)
        calculateButton.anchor(top:genderTextField.bottomAnchor, paddingTop: 18)
        
        view.addSubview(grayContainer)
        grayContainer.anchor(top:calculateButton.bottomAnchor, paddingTop: 40)
        
        grayContainer.addSubview(bodyFatLabel)
        bodyFatLabel.centerY(inView: grayContainer)
        bodyFatLabel.centerX(inView: grayContainer)
        
        view.addSubview(resultButton)
        resultButton.anchor(top:grayContainer.bottomAnchor, paddingTop: 60)
        resultButton.centerX(inView: view)

       
    }
    
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissPicker))
        toolBar.setItems([doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        genderTextField.inputAccessoryView = toolBar
        
    }
    
    func configureGenderDropdown(){
        let pickerView = UIPickerView()
        pickerView.tag = 2
        pickerView.delegate = self
        genderTextField.inputView = pickerView
        createToolbar()
    }
    
    func calculateBMI() -> Double {
        let height = Double(heightTextField.text!)
        let weight =  Double(weightTextField.text!)
  
        let bmi = (weight!) / (height! * height!)
        return bmi
    }

}

//MARK: -UIPickerViewDataSource

extension FatRateController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return genders.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
  
            return genders[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
   
            return genderTextField.text = genders[row]
        
    }
    
    
    
}




