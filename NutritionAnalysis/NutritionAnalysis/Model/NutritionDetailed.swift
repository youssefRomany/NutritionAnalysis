

import Foundation
struct NutritionDetailed : Codable {
	let uri : String?
	let yield : Int?
	let calories : Int?
	let totalWeight : Double?
	let dietLabels : [String]?
	let healthLabels : [String]?
	let cautions : [String]?
	let totalNutrients : TotalNutrients?
	let totalDaily : TotalDaily?
    let totalNutrientsKCal : TotalNutrientsKCal?
	let ingredients : [Ingredients]?

	enum CodingKeys: String, CodingKey {

		case uri = "uri"
		case yield = "yield"
		case calories = "calories"
		case totalWeight = "totalWeight"
		case dietLabels = "dietLabels"
		case healthLabels = "healthLabels"
		case cautions = "cautions"
		case totalNutrients = "totalNutrients"
		case totalDaily = "totalDaily"
        case totalNutrientsKCal = "totalNutrientsKCal"
		case ingredients = "ingredients"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		yield = try values.decodeIfPresent(Int.self, forKey: .yield)
		calories = try values.decodeIfPresent(Int.self, forKey: .calories)
		totalWeight = try values.decodeIfPresent(Double.self, forKey: .totalWeight)
		dietLabels = try values.decodeIfPresent([String].self, forKey: .dietLabels)
		healthLabels = try values.decodeIfPresent([String].self, forKey: .healthLabels)
		cautions = try values.decodeIfPresent([String].self, forKey: .cautions)
		totalNutrients = try values.decodeIfPresent(TotalNutrients.self, forKey: .totalNutrients)
		totalDaily = try values.decodeIfPresent(TotalDaily.self, forKey: .totalDaily)
		ingredients = try values.decodeIfPresent([Ingredients].self, forKey: .ingredients)
        totalNutrientsKCal = try values.decodeIfPresent(TotalNutrientsKCal.self, forKey: .totalNutrientsKCal)
	}
    
    init(calories: Int, totalWeight: Double, totalNutrients: TotalNutrients, totalDaily : TotalDaily) {
        self.uri = ""
        self.yield = nil
        self.calories = calories
        self.totalWeight = totalWeight
        self.dietLabels = nil
        self.healthLabels = nil
        self.cautions = nil
        self.totalNutrients = totalNutrients
        self.totalDaily = totalDaily
        self.totalNutrientsKCal = nil
        self.ingredients = nil
    }

}
