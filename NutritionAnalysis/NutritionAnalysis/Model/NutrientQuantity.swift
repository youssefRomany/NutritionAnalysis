//
//  NutrientQuantity.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import Foundation

struct NutrientQuantity : Codable {
    let label : String?
    let quantity : Double?
    let unit : String?

    enum CodingKeys: String, CodingKey {

        case label = "label"
        case quantity = "quantity"
        case unit = "unit"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        label = try values.decodeIfPresent(String.self, forKey: .label)
        quantity = try values.decodeIfPresent(Double.self, forKey: .quantity)
        unit = try values.decodeIfPresent(String.self, forKey: .unit)
    }
    
    init(label: String, quantity: Double, unit: String) {
        self.label = label
        self.quantity = quantity
        self.unit = unit
    }
}
