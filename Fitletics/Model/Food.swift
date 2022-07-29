//
//  Food.swift
//  Fitletics
//
//  Created by Ali YILMAZ on 27.07.2022.
//

import Foundation

struct Food : Codable{
    var name : String
    var calories : Double
    var protein_g : Double
    var carbohydrates_total_g : Double
    var serving_size_g : Double

}

struct Foods : Codable {
    var items : [Food]
}
