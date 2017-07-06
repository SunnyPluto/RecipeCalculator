//
//  AddIngredientsTableViewCell.swift
//  Food FormUla
//
//  Created by Developer on 7/5/17.
//  Copyright © 2017 Sunny4ka. All rights reserved.
//

import UIKit

protocol AddIngredientsTableViewCellDelegate: class {
    func addIngredientsTapped(cell: AddIngredientsTableViewCell)
}

class AddIngredientsTableViewCell: UITableViewCell {
    @IBOutlet weak var addIngredientTextField: UITextField!
    @IBOutlet weak var addAmountTextField: UITextField!

    @IBOutlet weak var addButton: UIButton!
   
    weak var delegate: AddIngredientsTableViewCellDelegate?
    
    @IBAction func addIngredientsTapped(_ sender: UIButton) {
        delegate?.addIngredientsTapped(cell: self)
    }
}
