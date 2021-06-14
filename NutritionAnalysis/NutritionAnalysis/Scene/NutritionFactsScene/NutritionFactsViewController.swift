//
//  NutritionFactsViewController.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import UIKit

class NutritionFactsViewController: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var totalFatLabel: UILabel!
    @IBOutlet weak var totalFatDailyLabel: UILabel!
    @IBOutlet weak var cholesterolLabel: UILabel!
    @IBOutlet weak var cholesterolDailyLabel: UILabel!
    @IBOutlet weak var sodiumLabel: UILabel!
    @IBOutlet weak var sodiumDailyLabel: UILabel!
    @IBOutlet weak var totalCarbohydrateLabel: UILabel!
    @IBOutlet weak var totalCarbohydrateDailyLabel: UILabel!
    @IBOutlet weak var dietaryFiberLabel: UILabel!
    @IBOutlet weak var dietaryFiberDailyLabel: UILabel!
    @IBOutlet weak var totalSugarsLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var proteinDailyLabel: UILabel!
    @IBOutlet weak var vitaminDLabel: UILabel!
    @IBOutlet weak var vitaminDDailyLabel: UILabel!
    @IBOutlet weak var calciumLabel: UILabel!
    @IBOutlet weak var calciumDailyLabel: UILabel!
    @IBOutlet weak var ironLabel: UILabel!
    @IBOutlet weak var ironDailyLabel: UILabel!
    @IBOutlet weak var potassiumLabel: UILabel!
    @IBOutlet weak var potassiumDailyLabel: UILabel!
    
    // MARK:- Variables
    var nutritionDetailedViewModel:NutritionDetailedViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()

    }

}

// MARK:- Helpers
extension NutritionFactsViewController {
    
    func initView() {
        initViewModelData()
    }
    
    func initViewModelData() {
        if let viewModel = nutritionDetailedViewModel {
            caloriesLabel.text = "\(viewModel.totalCalories)"
            totalFatLabel.text = viewModel.totalFatUnit
            totalFatDailyLabel.text = viewModel.totalFatUnitDaily
            cholesterolLabel.text = viewModel.totalCHOLEUnit
            cholesterolDailyLabel.text = viewModel.totalCHOLEUnitDaily
            sodiumLabel.text = viewModel.totalSodiumUnit
            sodiumDailyLabel.text = viewModel.totalSodiumUnitDaily
            totalCarbohydrateLabel.text = viewModel.totalCarbsUnit
            totalCarbohydrateDailyLabel.text = viewModel.totalCarbsUnitDaily
            dietaryFiberLabel.text = viewModel.totalCarbsFiberUnit
            dietaryFiberDailyLabel.text = viewModel.totalCarbsFiberUnitDaily
            totalSugarsLabel.text = viewModel.totalCarbsSugarUnit
            proteinLabel.text = viewModel.totalProteinUnit
            proteinDailyLabel.text = viewModel.totalProteinUnitDaily
            vitaminDLabel.text = viewModel.totalVitaminDUnit
            vitaminDDailyLabel.text = viewModel.totalVitaminDUnitDaily
            calciumLabel.text = viewModel.totalCalciumUnit
            calciumDailyLabel.text = viewModel.totalCalciumUnitDaily
            ironLabel.text = viewModel.totalIronUnit
            ironDailyLabel.text = viewModel.totalIronUnitDaily
            potassiumLabel.text = viewModel.totalPotassiumUnit
            potassiumDailyLabel.text = viewModel.totalPotassiumUnitDaily
        }
    }
}
