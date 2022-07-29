//
//  FatRateDetailsController.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 25.07.2022.
//

import UIKit

class  FatRateDetailsController : UIViewController {
    
    //MARK: -PROPERTIES
    
    private let infoLabel : UILabel = {
       let label = UILabel()
        label.text = "Your Fat Rate Analysis: "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    private let images: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "table")
        iv.setDimensions(height: 300, width: 350)
        return iv
    }()
    
    
    //MARK: -LIFECYLCE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    //MARK: -HELPERS
    
    func configureUI(){
        
        view.backgroundColor = UIColor(named: "fatrate")
        
        
        view.addSubview(infoLabel)
        infoLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 36, paddingLeft: 12)
        
        view.addSubview(images)
        images.centerY(inView: view)
        images.centerX(inView: view)
        
        
    }
    
    
}
