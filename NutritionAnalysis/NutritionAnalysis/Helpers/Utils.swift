//
//  Utils.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import Foundation
import UIKit
import SwiftMessages


//MARK: - handle message toast
public func displayMessage(message: String, messageError: Bool) {
    
    let view = MessageView.viewFromNib(layout: .cardView)
    if messageError == true {
        view.configureTheme(.error)
        view.configureTheme(backgroundColor: UIColor.systemRed, foregroundColor: .white)
    } else {
        view.configureTheme(.success)
        view.configureTheme(backgroundColor: UIColor.systemGray, foregroundColor: .white)
        //view.alpha = 0.8
    }
    
    //view.iconImageView?.isHidden = true
    //view.iconLabel?.isHidden = true
    view.titleLabel?.isHidden = true
    view.bodyLabel?.text = message
    view.titleLabel?.textColor = UIColor.white
    view.bodyLabel?.textColor = UIColor.white
    view.button?.isHidden = true
    view.alpha = 0.9
    var config = SwiftMessages.Config()
    config.presentationStyle = .bottom
    SwiftMessages.show(config: config, view: view)
}

extension UIView {
	/// Sets shadow for a UIView
	///
	/// - Parameters:
	///   - color: shadow color
	///   - offset: shadow offset
	///   - opacity: shadow opacity
	///   - radius: shadow blur radius
	///   - corderRadius: corner radius of the UIView
	func setShadowWithValues(color: UIColor, offset: CGSize, opacity: Float, radius: CGFloat, corderRadius: CGFloat) {
		self.layer.shadowColor = color.cgColor
		self.layer.shadowOffset = offset
		self.layer.shadowRadius = radius
		self.layer.shadowOpacity = opacity
		self.layer.cornerRadius = corderRadius
	}

	/// Sets border for a UIView
	///
	/// - Parameters:
	///   - color: border color
	///   - width: border width
	///   - corderRadius: corner radius of the UIView
	func setBorder(color: UIColor, width: CGFloat, corderRadius: CGFloat) {
		self.layer.borderColor = color.cgColor
		self.layer.borderWidth = width
		self.layer.cornerRadius = corderRadius
		self.clipsToBounds = true
	}
    
    /// Sets corner radius for a UIView
    ///
    /// - Parameters:
    ///   - corderRadius: corner radius of the UIView
    func setCornerRadius(corderRadius: CGFloat) {
        self.layer.cornerRadius = corderRadius
        self.clipsToBounds = true
    }
}
