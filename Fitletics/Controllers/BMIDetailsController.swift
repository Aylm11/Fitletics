//
//  BMIDetailsController.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 25.07.2022.
//

import UIKit

class  BMIDetailsController : UIViewController {
    
    //MARK: -PROPERTIES
    
    private let infoLabel : UILabel = {
       let label = UILabel()
        label.text = "Your Body Mass Index Analysis: "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let images: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "body")
        iv.setDimensions(height: 440, width: 310)
        return iv
    }()
    
    
    //MARK: -LIFECYLCE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    //MARK: -HELPERS
    
    func configureUI(){
        
        view.backgroundColor = UIColor(named: "bmi")
        
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 36, paddingLeft: 12)
        
        view.addSubview(images)
        images.centerY(inView: view)
        images.centerX(inView: view)
        
        
    }
    
    
}
