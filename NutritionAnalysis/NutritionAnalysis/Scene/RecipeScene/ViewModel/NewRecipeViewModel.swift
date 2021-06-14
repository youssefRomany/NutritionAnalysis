//
//  NewRecipeViewModel.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import Foundation

protocol NewRecipeViewModelprotocol {
    var ingredient: String? { get set }
    var nutritionDetailedViewModel:NutritionDetailedViewModel? { get set }
    
    var showLoading: Bindable<Bool> { get }

    var updateAnalyzeButtonState: ((Bool) -> ())? { get set }
    var navigate: ((NutritionDetailedViewModel) -> ())?  { get set }
    var onShowError: ((String) -> Void)?  { get set }
    
    func analyze()
}

class NewRecipeViewModel: NewRecipeViewModelprotocol {
    
    var ingredient: String? {
        didSet {
            validateInput()
        }
    }
    
    var nutritionDetailedViewModel: NutritionDetailedViewModel?
    
    var updateAnalyzeButtonState: ((Bool) -> ())?
    
    var navigate: ((NutritionDetailedViewModel) -> ())?
    
    var onShowError: ((String) -> Void)?
    
    var showLoading: Bindable<Bool> = Bindable(false)
    
    private let appServerClient: ApiNetworkProtocol
    private var validInputData: Bool = false {
        didSet {
            if oldValue != validInputData {
                updateAnalyzeButtonState?(validInputData)
            }
        }
    }
    
    init(appServerClient: ApiNetworkProtocol = ApiNetworkManager()) {
        self.appServerClient = appServerClient
    }
    
    func analyze() {
        guard let ingredientList = ingredient?.lines else {
            return
        }
    
        updateAnalyzeButtonState?(false)
        showLoading.value = true
        
        appServerClient.nutritionDetails(ingr: ingredientList) { [weak self] result in
            guard let `self` = self else {
                return
            }
            self.showLoading.value = false
            self.updateAnalyzeButtonState?(true)
            switch result {
            case .success(let nutritionDetails):
                self.nutritionDetailedViewModel = NutritionDetailedViewModel(nutritionDetailed: nutritionDetails)
                if let vm = self.nutritionDetailedViewModel {
                    self.navigate?(vm)
                }
            case .failure(let error):
                if let errors = error as? GetGeneralApiFailureReason {
                    self.onShowError?(errors.getErrorMessage() ?? "Unknown Error")
                }else {
                    self.onShowError?("Unknown Error")
                }
            }
        }
    }
    
    func validateInput() {
        let validData = [ingredient].filter {
            ($0?.count ?? 0) < 1
        }
        validInputData = (validData.count == 0) ? true : false
    }
    
}
