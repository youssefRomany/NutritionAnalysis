//
//  EdamamApi.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import Foundation
import Moya


enum EdamamApi {
    case nutritionDetails(ingr: [String])
}


extension EdamamApi: TargetType {
    var baseURL: URL {
        guard let url = URL(string: EdamamConfig.baseUrl) else {
            preconditionFailure("Invalid url")
        }
        return url
    }
    
    var path: String {
        return EdamamConfig.method
    }
    
    var method: Moya.Method {
        return .post
    }
    
    var sampleData: Data {
        Data()
    }
    
    var task: Task {
        switch self {
        case .nutritionDetails(let ingr):

            var ulrParameters = [String: Any]()
            ulrParameters[Params.appId] = EdamamConfig.appId
            ulrParameters[Params.apiKey] = EdamamConfig.apiKey

            var bodyParameters = [String: Any]()
            bodyParameters[Params.ingr] = ingr
            
            return .requestCompositeParameters(bodyParameters: bodyParameters, bodyEncoding: JSONEncoding.default, urlParameters: ulrParameters)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
