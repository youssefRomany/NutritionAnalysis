//
//  MockService.swift
//  NutritionAnalysisTests
//
//  Created by YoussefRomany on 14/06/2021.
//

import Foundation
@testable import NutritionAnalysis

class MockService: ApiNetworkProtocol {
    
    let mockData: NutritionDetailed?
    
    init(mockData: NutritionDetailed?) {
        self.mockData = mockData
    }
    
    func nutritionDetails(ingr: [String], completionHandler: @escaping (Result<NutritionDetailed, Error>) -> ()) {
        if let data = mockData {
            completionHandler(.success(data))
        }else {
            completionHandler(.failure(GetGeneralApiFailureReason.notFound))
        }
    }
}
