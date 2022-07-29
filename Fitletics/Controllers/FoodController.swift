//
//  FoodController.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 25.07.2022.
//

import UIKit

let searchIdentifier = "FoodCell"

class FoodController : UITableViewController {
    
    //MARK: -PROPERTIES

    private var foods = [Food]()
    private var filteredFoods = [Food]()
    
    private let searchController = UISearchController(searchResultsController: nil)
    
    private var inSearchMode:Bool {
        return !searchController.searchBar.text!.isEmpty && searchController.isActive
    }
    
    
    
    //MARK: -LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "fitlogo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        configureSearchController()
        configureGradientLayer()
        tableView.register(FoodCell.self, forCellReuseIdentifier: searchIdentifier)
        tableView.rowHeight = 130
        tableView.backgroundColor = .systemGray4
        
                
    }
    
    
    //MARK: -HELPERS
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        definesPresentationContext = false
        searchController.searchBar.placeholder = "Search for Food"
        searchController.searchBar.searchBarStyle = .minimal
        searchController.searchBar.showsCancelButton = false
        
    }
    
}

//MARK: -UITableViewDataSource

extension FoodController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        //let food = inSearchMode ? filteredFoods : foods
        return foods.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        //let food = inSearchMode ? filteredFoods : foods
        let food = foods[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: searchIdentifier, for: indexPath) as! FoodCell
        cell.viewModel = FoodCellViewModel(food: food)
        return cell
    }
}

//MARK: -UISearchResultsUpdating

extension FoodController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
  
        
   
        
        FoodService.fetchFood(query: searchText) { foods in
            DispatchQueue.main.async {
                self.foods = foods
                self.tableView.reloadData()
            }
              
        }
        
        //filteredFoods = foods.filter({ $0.name.contains(searchText)})
        
        //self.tableView.reloadData()
    }
    
    
    
}


