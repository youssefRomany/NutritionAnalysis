//
//  String+Extension.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import Foundation

extension String {
    var lines: [String] {
        return self.components(separatedBy: "\n")
    }
}
