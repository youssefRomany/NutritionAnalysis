//
//  NutritionDetailedViewModel.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import Foundation

struct NutritionDetailedViewModel {
    
    let nutritionDetailed: NutritionDetailed
    
    init(nutritionDetailed :NutritionDetailed) {
        self.nutritionDetailed = nutritionDetailed
    }
    
    var totalCalories: Double {
        guard let totalCalories = nutritionDetailed.totalNutrientsKCal?.eNERC_KCAL?.quantity else {
            return 0
        }
        return totalCalories.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalFat: Double {
        guard let totalFat = nutritionDetailed.totalNutrients?.fAT?.quantity else {
            return 0
        }
        return totalFat.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalFatUnit: String {
        guard let totalFatUnit = nutritionDetailed.totalNutrients?.fAT?.unit else {
            return ""
        }
        return String(format: "%.1f", totalFat) + " \(totalFatUnit)"
    }
    
    var totalFatDaily: Double {
        guard let totalFat = nutritionDetailed.totalDaily?.fAT?.quantity else {
            return 0
        }
        return totalFat.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalFatUnitDaily: String {
        guard let totalFatUnit = nutritionDetailed.totalDaily?.fAT?.unit else {
            return ""
        }
        return String(format: "%.0f", totalFatDaily) + " \(totalFatUnit)"
    }
    
    
    var totalCHOLE: Double {
        guard let totalCHOLE = nutritionDetailed.totalNutrients?.cHOLE?.quantity else {
            return 0
        }
        return totalCHOLE.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalCHOLEUnit: String {
        guard let totalCHOLEUnit = nutritionDetailed.totalNutrients?.cHOLE?.unit else {
            return ""
        }
        return String(format: "%.1f", totalCHOLE) + " \(totalCHOLEUnit)"
    }
    
    var totalCHOLEDaily: Double {
        guard let totalCHOLEDaily = nutritionDetailed.totalDaily?.cHOLE?.quantity else {
            return 0
        }
        return totalCHOLEDaily.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalCHOLEUnitDaily: String {
        guard let totalCHOLEUnitDaily = nutritionDetailed.totalDaily?.cHOLE?.unit else {
            return ""
        }
        return String(format: "%.0f", totalCHOLEDaily) + " \(totalCHOLEUnitDaily)"
    }
    
    var totalSodium: Double {
        guard let totalSodium = nutritionDetailed.totalNutrients?.nA?.quantity else {
            return 0
        }
        return totalSodium.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalSodiumUnit: String {
        guard let totalSodiumUnit = nutritionDetailed.totalNutrients?.nA?.unit else {
            return ""
        }
        return String(format: "%.1f", totalSodium) + " \(totalSodiumUnit)"
    }
    
    var totalSodiumDaily: Double {
        guard let totalSodiumDaily = nutritionDetailed.totalDaily?.nA?.quantity else {
            return 0
        }
        return totalSodiumDaily.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalSodiumUnitDaily: String {
        guard let totalSodiumUnitDaily = nutritionDetailed.totalDaily?.nA?.unit else {
            return ""
        }
        return String(format: "%.0f", totalSodiumDaily) + " \(totalSodiumUnitDaily)"
    }
    
    var totalCarbs: Double {
        guard let totalCarbs = nutritionDetailed.totalNutrients?.cHOCDF?.quantity else {
            return 0
        }
        return totalCarbs.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalCarbsUnit: String {
        guard let totalCarbsUnit = nutritionDetailed.totalNutrients?.cHOCDF?.unit else {
            return ""
        }
        return String(format: "%.1f", totalCarbs) + " \(totalCarbsUnit)"
    }
    
    var totalCarbsDaily: Double {
        guard let totalCarbsDaily = nutritionDetailed.totalDaily?.cHOCDF?.quantity else {
            return 0
        }
        return totalCarbsDaily.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalCarbsUnitDaily: String {
        guard let totalCarbsUnitDaily = nutritionDetailed.totalDaily?.cHOCDF?.unit else {
            return ""
        }
        return String(format: "%.0f", totalCarbsDaily) + " \(totalCarbsUnitDaily)"
    }
    
    var totalCarbsFiber: Double {
        guard let totalCarbsFiber = nutritionDetailed.totalNutrients?.fIBTG?.quantity else {
            return 0
        }
        return totalCarbsFiber.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalCarbsFiberUnit: String {
        guard let totalCarbsFiberUnit = nutritionDetailed.totalNutrients?.fIBTG?.unit else {
            return ""
        }
        return String(format: "%.1f", totalCarbsFiber) + " \(totalCarbsFiberUnit)"
    }
    
    var totalCarbsFiberDaily: Double {
        guard let totalCarbsFiberDaily = nutritionDetailed.totalDaily?.fIBTG?.quantity else {
            return 0
        }
        return totalCarbsFiberDaily.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalCarbsFiberUnitDaily: String {
        guard let totalCarbsFiberUnitDaily = nutritionDetailed.totalDaily?.fIBTG?.unit else {
            return ""
        }
        return String(format: "%.0f", totalCarbsFiberDaily) + " \(totalCarbsFiberUnitDaily)"
    }
    
    var totalCarbsSugar: Double {
        guard let totalCarbsSugar = nutritionDetailed.totalNutrients?.sUGAR?.quantity else {
            return 0
        }
        return totalCarbsSugar.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalCarbsSugarUnit: String {
        guard let totalCarbsSugarUnit = nutritionDetailed.totalNutrients?.sUGAR?.unit else {
            return ""
        }
        return String(format: "%.1f", totalCarbsSugar) + " \(totalCarbsSugarUnit)"
    }
    
    var totalProtein: Double {
        guard let totalProtein = nutritionDetailed.totalNutrients?.pROCNT?.quantity else {
            return 0
        }
        return totalProtein.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalProteinUnit: String {
        guard let totalProteinUnit = nutritionDetailed.totalNutrients?.pROCNT?.unit else {
            return ""
        }
        return String(format: "%.1f", totalProtein) + " \(totalProteinUnit)"
    }
    
    var totalProteinDaily: Double {
        guard let totalProteinDaily = nutritionDetailed.totalDaily?.pROCNT?.quantity else {
            return 0
        }
        return totalProteinDaily.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalProteinUnitDaily: String {
        guard let totalProteinUnitDaily = nutritionDetailed.totalDaily?.pROCNT?.unit else {
            return ""
        }
        return String(format: "%.0f", totalProteinDaily) + " \(totalProteinUnitDaily)"
    }
    
    
    var totalVitaminD: Double {
        guard let totalVitaminD = nutritionDetailed.totalNutrients?.vITD?.quantity else {
            return 0
        }
        return totalVitaminD.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalVitaminDUnit: String {
        guard let totalVitaminDUnit = nutritionDetailed.totalNutrients?.vITD?.unit else {
            return ""
        }
        return String(format: "%.1f", totalVitaminD) + " \(totalVitaminDUnit)"
    }
    
    var totalVitaminDDaily: Double {
        guard let totalVitaminDDaily = nutritionDetailed.totalDaily?.vITD?.quantity else {
            return 0
        }
        return totalVitaminDDaily.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalVitaminDUnitDaily: String {
        guard let totalVitaminDUnitDaily = nutritionDetailed.totalDaily?.vITD?.unit else {
            return ""
        }
        return String(format: "%.0f", totalVitaminDDaily) + " \(totalVitaminDUnitDaily)"
    }
    
    
    var totalCalcium: Double {
        guard let totalCalcium = nutritionDetailed.totalNutrients?.cA?.quantity else {
            return 0
        }
        return totalCalcium.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalCalciumUnit: String {
        guard let totalCalciumUnit = nutritionDetailed.totalNutrients?.cA?.unit else {
            return ""
        }
        return String(format: "%.1f", totalCalcium) + " \(totalCalciumUnit)"
    }
    
    var totalCalciumDaily: Double {
        guard let totalCalciumDaily = nutritionDetailed.totalDaily?.cA?.quantity else {
            return 0
        }
        return totalCalciumDaily.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalCalciumUnitDaily: String {
        guard let totalCalciumUnitDaily = nutritionDetailed.totalDaily?.cA?.unit else {
            return ""
        }
        return String(format: "%.0f", totalCalciumDaily) + " \(totalCalciumUnitDaily)"
    }
    
    var totalIron: Double {
        guard let totalIron = nutritionDetailed.totalNutrients?.fE?.quantity else {
            return 0
        }
        return totalIron.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalIronUnit: String {
        guard let totalIronUnit = nutritionDetailed.totalNutrients?.fE?.unit else {
            return ""
        }
        return String(format: "%.1f", totalIron) + " \(totalIronUnit)"
    }
    
    var totalIronDaily: Double {
        guard let totalIronDaily = nutritionDetailed.totalDaily?.fE?.quantity else {
            return 0
        }
        return totalIronDaily.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalIronUnitDaily: String {
        guard let totalIronUnitDaily = nutritionDetailed.totalDaily?.fE?.unit else {
            return ""
        }
        return String(format: "%.0f", totalIronDaily) + " \(totalIronUnitDaily)"
    }
    
    var totalPotassium: Double {
        guard let totalPotassium = nutritionDetailed.totalNutrients?.k?.quantity else {
            return 0
        }
        return totalPotassium.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalPotassiumUnit: String {
        guard let totalPotassiumUnit = nutritionDetailed.totalNutrients?.k?.unit else {
            return ""
        }
        return String(format: "%.1f", totalPotassium) + " \(totalPotassiumUnit)"
    }
    
    var totalPotassiumDaily: Double {
        guard let totalPotassiumDaily = nutritionDetailed.totalDaily?.k?.quantity else {
            return 0
        }
        return totalPotassiumDaily.rounded(.toNearestOrAwayFromZero)
    }
    
    var totalPotassiumUnitDaily: String {
        guard let totalPotassiumUnitDaily = nutritionDetailed.totalDaily?.k?.unit else {
            return ""
        }
        return String(format: "%.0f", totalPotassiumDaily) + " \(totalPotassiumUnitDaily)"
    }
}
