//
//  FoodService.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 27.07.2022.
//

import Foundation

struct FoodService {
   
    
    static func fetchFood(query:String, completion: @escaping([Food]) -> Void) {
        
        var foods = [Food]()
            guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
            let url = URL(string: "https://api.calorieninjas.com/v1/nutrition?query=\(query)")
            var request = URLRequest(url: url!)
            request.setValue("YFhdG19FT8R1J9q1mtfpxA==hGnkP0b8ChgsdjO9", forHTTPHeaderField: "X-Api-Key")
            let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
                guard let data = data else { return }
                
                let decoder = JSONDecoder()
                
                if let jsonData = try? decoder.decode(Foods.self, from: data){
                    foods = jsonData.items
                }
                
                completion(foods)
            }
            task.resume()
        
    
       }

}
