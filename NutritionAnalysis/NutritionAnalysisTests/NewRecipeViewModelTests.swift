//
//  NewRecipeViewModelTests.swift
//  NutritionAnalysisTests
//
//  Created by YoussefRomany on 14/06/2021.
//

import XCTest
@testable import NutritionAnalysis

class NewRecipeViewModelTests: XCTestCase {
    
    func testSuccessFetchData() {
        let expectedModel = NutritionDetailed.withMock()
        
        let service = MockService(mockData: expectedModel)
        
        let viewModel = NewRecipeViewModel(appServerClient: service)
        
        viewModel.ingredient = "1 cup rice\n10 oz chickpeas"
        viewModel.analyze()
        
        XCTAssertTrue(!viewModel.showLoading.value)
        XCTAssertEqual(viewModel.ingredient?.lines, ["1 cup rice","10 oz chickpeas"])
        XCTAssertTrue((viewModel.nutritionDetailedViewModel != nil))
        XCTAssertEqual(viewModel.nutritionDetailedViewModel?.totalFat, 18.0)
        XCTAssertEqual(viewModel.nutritionDetailedViewModel?.totalFatDaily, 28)
        XCTAssertEqual(viewModel.nutritionDetailedViewModel?.totalCarbs, 333.0)
        XCTAssertEqual(viewModel.nutritionDetailedViewModel?.totalCarbsDaily, 111.0)
        XCTAssertEqual(viewModel.nutritionDetailedViewModel?.totalProtein, 71.0)
        XCTAssertEqual(viewModel.nutritionDetailedViewModel?.totalProteinDaily, 142.0)
    }
    
    func testNilFetchData() {
        let expectedModel: NutritionDetailed? = nil
        
        let service = MockService(mockData: expectedModel)
        
        let viewModel = NewRecipeViewModel(appServerClient: service)
        
        viewModel.analyze()
        
        XCTAssertTrue(!viewModel.showLoading.value)
        XCTAssertNil(viewModel.nutritionDetailedViewModel)
    }

}
