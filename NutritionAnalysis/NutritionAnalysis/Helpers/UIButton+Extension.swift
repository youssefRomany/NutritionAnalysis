//
//  AppDelegate.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//


import UIKit


extension UIButton{
    
    func enableButton(){
        self.isEnabled = true
        self.backgroundColor = UIColor.systemGreen
    }
    
    func disableButton(){
        self.isEnabled = false
        self.backgroundColor = UIColor.systemGray
    }
}
