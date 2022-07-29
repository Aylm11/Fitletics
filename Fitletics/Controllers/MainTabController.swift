//
//  MainTabController.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 25.07.2022.
//

import UIKit

class MainTabController :  UITabBarController {
    
    //MARK: -LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureViewControllers()
       
    }
    
    
    
    //MARK: -HELPERS
    
    func configureUI() {
        view.backgroundColor = .white
    
        UITabBar.appearance().backgroundColor = UIColor(named: "tabbar")
        UITabBar.appearance().unselectedItemTintColor = .darkGray
        tabBar.tintColor = .white 
    }
    
    
    func configureViewControllers(){
        
        let calorie = templateController(title: "Calorie Needs",selectedImage: UIImage(named: "calorie")!, rootViewController: CalorieNeedController())

        let bmi = templateController(title: "BMI",selectedImage: UIImage(named: "bmi")!, rootViewController: BMIController())
        
        let fatrate = templateController(title: "Fat Rate",selectedImage: UIImage(named: "fatrate")!, rootViewController: FatRateController())
        
        let food = templateController(title: "Foods",selectedImage: UIImage(named: "food")!, rootViewController: FoodController())
            
        viewControllers = [calorie, bmi, fatrate, food]
        
    }
    
    func templateController(title : String,selectedImage : UIImage, rootViewController : UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.tabBarItem.title = title
        
        nav.tabBarItem.image = selectedImage
        tabBar.tintColor = .white
        
        return nav
    }
    
    
    
    
    
    
    
    
}
