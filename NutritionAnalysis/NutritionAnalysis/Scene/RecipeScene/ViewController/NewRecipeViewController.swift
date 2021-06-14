//
//  NewRecipeViewController.swift
//  NutritionAnalysis
//
//  Created by YoussefRomany on 14/06/2021.
//

import UIKit
import IQKeyboardManagerSwift

class NewRecipeViewController: UIViewController {
    
    //MARK:- IBOutlet
    @IBOutlet weak var textViewContainer: UIView!
    @IBOutlet weak var textView: UITextView! {
        didSet {
            textView.delegate = self
        }
    }
    @IBOutlet weak var analyzeButton: UIButton!
    
    // MARK:- Variables
    lazy var viewModel: NewRecipeViewModel = {
       return NewRecipeViewModel()
    }()

    //MARK:- Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initView()
    }
    
    // MARK:- IBActions
    @IBAction func analyzeAction(_ sender: Any) {
        viewModel.analyze()
    }

}


// MARK:- Helpers
extension NewRecipeViewController {
    func initView() {
        setSetupTextViewContainer()
        setupAnalyzeBtn()
        bindViewModel()
    }
    
    func setSetupTextViewContainer() {
        textViewContainer.setBorder(color: UIColor.systemGray, width: 1, corderRadius: 10)
    }
    
    func setupAnalyzeBtn() {
        analyzeButton.setCornerRadius(corderRadius: 10)
    }
    
    func bindViewModel() {
        viewModel.showLoading.bind { [weak self] visible in
            if let `self` = self {
                visible ? self.showIndicator(withTitle: "Indicator", and: "fetching details") : self.hideIndicator()
            }
        }

        viewModel.updateAnalyzeButtonState = { [weak self] state in
            state ? self?.analyzeButton.enableButton() : self?.analyzeButton.disableButton()
        }

        viewModel.navigate = { [weak self] nutritionDetailedViewModel in
            guard let self = self else {
                 return
             }
            let vc = NutritionFactsViewController.instantiate(fromAppStoryboard: .MAIN)
            vc.nutritionDetailedViewModel = nutritionDetailedViewModel
            self.navigationController?.pushViewController(vc, animated: true)

        }

        viewModel.onShowError = { message in
            displayMessage(message: message, messageError: true)
        }
    }
    
}

// MARK:- UI Text View Delegate
extension NewRecipeViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        viewModel.ingredient = textView.text ?? ""
    }
}
