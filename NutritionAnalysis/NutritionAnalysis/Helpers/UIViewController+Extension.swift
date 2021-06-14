//
//  UIViewController+Extension.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import Foundation
import MBProgressHUD

enum STORYBOARDS: String, CaseIterable {
    case MAIN = "Main"
    
    var instance: UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
   func viewController<T: UIViewController>(viewControllerClass: T.Type) -> T {
       let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID

       guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
           fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.")
       }
       return scene
   }
    
   func initialViewController() -> UIViewController? {
       return instance.instantiateInitialViewController()
   }
    
}

extension UIViewController {
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID: String {
        return "\(self)"
    }
 
    static func instantiate(fromAppStoryboard appStoryboard: STORYBOARDS) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}


extension UIViewController {
   func showIndicator(withTitle title: String, and Description:String) {
      let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
      Indicator.label.text = title
      Indicator.isUserInteractionEnabled = false
      Indicator.detailsLabel.text = Description
      Indicator.show(animated: true)
   }
   func hideIndicator() {
      MBProgressHUD.hide(for: self.view, animated: true)
   }
}
