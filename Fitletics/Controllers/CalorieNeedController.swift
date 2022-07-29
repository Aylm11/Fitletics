//
//  CalorieNeedController.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 23.07.2022.
//

import Foundation
import UIKit


class CalorieNeedController : UIViewController, UIPickerViewDelegate {
    
    //MARK: -PROPERTIES
    
    private let genders = ["Male", "Female"]
    private let activities = ["Sedentary", "Lightly Active", "Moderately Active", "Very Active", "Extra Active"]
    
    private let infoLabel : UILabel = {
       let label = UILabel()
        label.text = "Your Daily Calorie Need: "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .lightGray
        return label
    }()
    
    private let heightTextField : UITextField = {
        let tf = CustomTextField(placeholder: "Height (CM)")
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let ageTextField : UITextField = {
        let tf = CustomTextField(placeholder: "Age")
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let weightTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Weight (KG)")
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let activityTextField : UITextField = {
        let tf = CustomTextField(placeholder: "Activity Factor")
        
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
        
        tf.rightView = uv
        tf.rightViewMode = .always
        
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
    
    private let calorieLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    //MARK: -LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureGenderDropdown()
        configureActivityDropdown()
        
    }
    
    //MARK: -ACTIONS
    
    @objc func dismissPicker() {
        view.endEditing(true)
    }
    
    @objc func handleCalculate() {
        
        if activityTextField.text?.isEmpty == false && genderTextField.text?.isEmpty == false && heightTextField.text?.isEmpty == false && weightTextField.text?.isEmpty == false && ageTextField.text?.isEmpty == false {
       
        if activityTextField.text == "Sedentary" {
            let calories = calculateBMR() * 1.2
            calorieLabel.text = String(Int(calories)) + " CALORIE"
        }else if activityTextField.text == "Lightly Active"{
            let calories = calculateBMR() * 1.375
            calorieLabel.text = String(Int(calories)) + " CALORIE"
        }else if activityTextField.text == "Moderately Active"{
            let calories = calculateBMR() * 1.55
            calorieLabel.text = String(Int(calories)) + " CALORIE"
        }else if activityTextField.text == "Very Active" {
            let calories = calculateBMR() * 1.725
            calorieLabel.text = String(Int(calories)) + " CALORIE"
        }else if activityTextField.text == "Extra Active" {
            let calories = calculateBMR() * 1.9
            calorieLabel.text = String(Int(calories)) + " CALORIE"
        }

        } else {
            showMessage(withTitle: "Fill the all fields.", message: "There are empty fields.")
        }
   
    }
    
    //MARK: -HELPERS
    
    func configureUI(){
        
        
        navigationController?.navigationBar.topItem?.hidesBackButton = true
        view.backgroundColor = .white
        navigationController?.navigationBar.barStyle = .black
        let logo = UIImage(named: "fitlogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        //navigationController?.navigationBar.isHidden = true
        
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor,UIColor(red: 96, green: 96, blue: 96, alpha: 100) ]
        gradient.locations = [0, 1]
        view.layer.addSublayer(gradient)
        gradient.frame = view.frame
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 36, paddingLeft: 12)
        
        let stackViewLeft = UIStackView(arrangedSubviews: [heightTextField, ageTextField])
        stackViewLeft.axis = .vertical
        stackViewLeft.spacing = 15
        
        
        let stackViewRight = UIStackView(arrangedSubviews: [weightTextField, activityTextField])
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
        
        grayContainer.addSubview(calorieLabel)
        calorieLabel.centerY(inView: grayContainer)
        calorieLabel.centerX(inView: grayContainer)
        
        

       
    }
    
    func createToolbar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.dismissPicker))
        toolBar.setItems([doneButton], animated: false)
        
        toolBar.isUserInteractionEnabled = true
        genderTextField.inputAccessoryView = toolBar
        activityTextField.inputAccessoryView = toolBar
    }
    
    func configureActivityDropdown(){
        let pickerView = UIPickerView()
        pickerView.tag = 1
        pickerView.delegate = self
        activityTextField.inputView = pickerView
        createToolbar()
    }
    
    func configureGenderDropdown(){
        let pickerView = UIPickerView()
        pickerView.tag = 2
        pickerView.delegate = self
        genderTextField.inputView = pickerView
        createToolbar()
    }
    
    func calculateBMR() -> Double {
        let height = Double(heightTextField.text!)
        let weight =  Double(weightTextField.text!)
        let gender = genderTextField.text!
        let age = Double(ageTextField.text!)
        let activity = activityTextField.text!
        
        if genderTextField.text == "Male" {
            return 88.362 + (13.397 * weight!) + (4.799 * height!) - (5.677 * age!)
        }else {
            return  447.593 + (9.247 * weight!) + (3.098 * height!) - (4.330 * age!)
        }
    }

}

//MARK: -UIPickerViewDataSource

extension CalorieNeedController : UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return activities.count
        }else {
            return genders.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return activities[row]
        }else {
            return genders[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            return activityTextField.text = activities[row]
        }else {
            return genderTextField.text = genders[row]
        }
    }
    
    
    
}




