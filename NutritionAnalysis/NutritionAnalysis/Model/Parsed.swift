
import Foundation
struct Parsed : Codable {
	let quantity : Int?
	let measure : String?
	let foodMatch : String?
	let food : String?
	let foodId : String?
	let weight : Double?
	let retainedWeight : Double?
	let nutrients : Nutrients?

	enum CodingKeys: String, CodingKey {

		case quantity = "quantity"
		case measure = "measure"
		case foodMatch = "foodMatch"
		case food = "food"
		case foodId = "foodId"
		case weight = "weight"
		case retainedWeight = "retainedWeight"
		case nutrients = "nutrients"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
		measure = try values.decodeIfPresent(String.self, forKey: .measure)
		foodMatch = try values.decodeIfPresent(String.self, forKey: .foodMatch)
		food = try values.decodeIfPresent(String.self, forKey: .food)
		foodId = try values.decodeIfPresent(String.self, forKey: .foodId)
		weight = try values.decodeIfPresent(Double.self, forKey: .weight)
		retainedWeight = try values.decodeIfPresent(Double.self, forKey: .retainedWeight)
		nutrients = try values.decodeIfPresent(Nutrients.self, forKey: .nutrients)
	}
    
    init(quantity : Int, measure : String, food : String, weight : Double,nutrients : Nutrients) {
        self.quantity = quantity
        self.measure = measure
        self.foodMatch = ""
        self.food = food
        self.foodId = ""
        self.weight = weight
        self.retainedWeight = 0
        self.nutrients = nutrients
    }

}
