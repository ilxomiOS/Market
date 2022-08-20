//
//  Sneakers.swift
//  Online Market 4
//
//  Created by Ilxom on 18/08/22.
//

import Foundation

struct Sneakers {
    let brand: String
    let model: String
    let sizes = ["39", "40", "41", "42", "43", "44", "45"]
    let price: Int
    
    var sneakers: String {
        "\(brand) \(model)"
    }
}

extension Sneakers {
    static func getSneakersData() -> [Sneakers] {
        var arrayOfSneakers: [Sneakers] = []
        
        let brands = DataManager.shared.brands
        let models = DataManager.shared.models
        let prices = DataManager.shared.prices
        
        for index in 0..<brands.count {
            let sneakers = Sneakers(brand: brands[index], model: models[index], price: prices[index])
            arrayOfSneakers.append(sneakers)
        }
        return arrayOfSneakers
    }
}
