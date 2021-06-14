//
//  ApiNetworkManager.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import Foundation
import Moya

// MARK: - Error
enum GetGeneralApiFailureReason: Int, Error {
    case unAuthorized = 401
    case badRequest = 400
    case notFound = 404
    case apiError = 500
    case notHandleStatusCode = 0
}

extension GetGeneralApiFailureReason {
    func getErrorMessage() -> String? {
        switch self {
        case .unAuthorized:
            return "Unauthorized"
        case .notFound:
           return "Not Found"
        case .badRequest:
            return "Bad Request"
        default :
            return "Unknown Error"
        }
    }
}


protocol ApiNetworkProtocol {
    func nutritionDetails(ingr: [String] ,completionHandler: @escaping (Result<NutritionDetailed, Error>)->() )
}

class ApiNetworkManager {
    let provider = MoyaProvider<EdamamApi>(plugins: [NetworkLoggerPlugin()])
}


extension ApiNetworkManager: ApiNetworkProtocol {
    func nutritionDetails(ingr: [String], completionHandler: @escaping (Result<NutritionDetailed, Error>) -> ()) {
        provider.request(.nutritionDetails(ingr: ingr)) { result in
            switch result {
            case .success(let response):
                print("mmmmmm",String(decoding: response.data, as: UTF8.self))
                if response.statusCode == 200 {
                    do {
                        let nutritionDetail = try JSONDecoder().decode(NutritionDetailed.self, from: response.data)
                        completionHandler(.success(nutritionDetail))
                    } catch let error {
                        // handle error
                        completionHandler(.failure(error))
                    }
                }else {
                    if let reason = GetGeneralApiFailureReason(rawValue: response.statusCode) {
                         completionHandler(.failure(reason))
                    }else {
                        completionHandler(.failure(GetGeneralApiFailureReason.notHandleStatusCode))
                    }
                }
            case .failure(let error):
                // handle error
                 completionHandler(.failure(error))
            }
        }
    }
    
    
}
