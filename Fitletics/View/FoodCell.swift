//
//  FoodCell.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 27.07.2022.
//

import Foundation
import UIKit

class FoodCell : UITableViewCell {
    
    //MARK: -PROPERTIES
    
    var viewModel: FoodCellViewModel? {
        didSet{configure()}
    }

    
    private let nameLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let servingSizeLabel : UILabel = {
       let label = UILabel()
        return label
    }()

    private let calorieLabel : UILabel = {
       let label = UILabel()
        return label
    }()

    private let proteinLabel : UILabel = {
       let label = UILabel()
        return label
    }()

    
    private let carbohydrateLabel : UILabel = {
       let label = UILabel()
        return label
    }()

    //MARK: -LIFECYCLE
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemGray4
        
        addSubview(nameLabel)
        nameLabel.centerX(inView: self, topAnchor: topAnchor, paddingTop: 0)
        
        let stackLeft = UIStackView(arrangedSubviews: [calorieLabel, servingSizeLabel])
        stackLeft.axis = .vertical
        stackLeft.spacing = 4
        stackLeft.alignment = .leading
        addSubview(stackLeft)
        
        stackLeft.anchor(top:nameLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 4, paddingLeft: 10, paddingBottom: 10)
        
        let stackRight = UIStackView(arrangedSubviews: [proteinLabel, carbohydrateLabel])
        stackRight.axis = .vertical
        stackRight.spacing = 12
        stackRight.alignment = .leading
        addSubview(stackRight)
        
        stackRight.anchor(top: nameLabel.bottomAnchor,bottom: bottomAnchor,right: rightAnchor, paddingTop: 4,paddingBottom: 10, paddingRight: 10 )
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    //MARK: -HELPERS
    
    
    func configure(){
        guard let viewModel = viewModel else {
            return
        }

        proteinLabel.text = "Protein: \(String(viewModel.protein)) g"
        carbohydrateLabel.text = "Carbohydrate: \(String(viewModel.carb)) g"
        servingSizeLabel.text = "Serving Size: \(String(viewModel.size)) g"
        calorieLabel.text = "Calories: \(String(viewModel.calorie)) g"
        nameLabel.text = viewModel.name.uppercased()
        
    }
    
    
}
