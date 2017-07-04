//
//  MeasurementView.swift
//  Food FormUla
//
//  Created by Sunny4ka on 6/6/17.
//  Copyright © 2017 Sunny4ka. All rights reserved.
//

import Foundation
import UIKit

class MeasurementView: UIView {
    enum FormType: Int {
        case square = 0
        case circle = 1
    }
    
    @IBOutlet var formTypeSegmentedControl: UISegmentedControl!
    @IBOutlet var formMeasureTextField: UITextField!
    @IBOutlet var formMeasureLabel: UILabel!
    
    @IBAction func formTypePressed(_ sender: UISegmentedControl) {
        configureFormType()
    }
    
    func configureFormType() {
        if formTypeSegmentedControl.selectedSegmentIndex == 0 {
            formMeasureLabel.text = "Side"
        } else {
            formMeasureLabel.text = "Diameter"
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureFormType()
    }
    
    func clearTextField() {
        formMeasureTextField.text = ""
    }
}
