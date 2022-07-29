//
//  BMIController.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 25.07.2022.
//

import UIKit

class BMIController : UIViewController {
    
    //MARK: -PROPERTIES
    
    private let infoLabel : UILabel = {
       let label = UILabel()
        label.text = "Your Body Mass Index: "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .lightGray
        return label
    }()
    
    private let heightTextField : UITextField = {
        let tf = CustomTextField(placeholder: "Height (M)")
        tf.keyboardType = .numberPad
        return tf
    }()
    
    private let weightTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Weight (KG)")
        tf.keyboardType = .numberPad
        return tf
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
    
    private let bmiLabel : UILabel = {
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
     
    }
    
    //MARK: -ACTIONS
    
    @objc func handleCalculate() {
        let height = Double(heightTextField.text!)
        let weight = Double(weightTextField.text!)
        
        if heightTextField.text?.isEmpty == false && weightTextField.text?.isEmpty == false {
       
            let bmi = (weight!) / (height! * height!)
           
                bmiLabel.text = "\(String(Int(bmi)))kg/m2"
            
        

        } else {
            showMessage(withTitle: "Fill the all fields.", message: "There are empty fields.")
        }
   
    }
    
    @objc func handleShowResult(){
        present(BMIDetailsController(), animated: true, completion: nil)
    }
    
    
    
    //MARK: -HELPERS
    
    func configureUI(){
    
        configureGradientLayer()
        let logo = UIImage(named: "fitlogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        navigationController?.navigationBar.barStyle = .black
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 36, paddingLeft: 12)
        
        let stackView = UIStackView(arrangedSubviews: [heightTextField, weightTextField])
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        view.addSubview(stackView)
        stackView.anchor(top:infoLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingRight: 10)
        
        view.addSubview(calculateButton)
        calculateButton.anchor(top:stackView.bottomAnchor, paddingTop: 20)
        calculateButton.centerX(inView: view)
        
        view.addSubview(grayContainer)
        grayContainer.anchor(top:calculateButton.bottomAnchor, paddingTop: 40)
        
        grayContainer.addSubview(bmiLabel)
        bmiLabel.centerY(inView: grayContainer)
        bmiLabel.centerX(inView: grayContainer)
        
        
        view.addSubview(resultButton)
        resultButton.anchor(top:grayContainer.bottomAnchor, paddingTop: 60)
        resultButton.centerX(inView: view)
    }
    
}
