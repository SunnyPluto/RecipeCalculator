//
//  ViewController.swift
//  Food FormUla
//
//  Created by Sunny4ka on 6/6/17.
//  Copyright © 2017 Sunny4ka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddIngredientsTableViewCellDelegate {
    
    var ingridients: [Ingredient] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "IngredientsTableHeaderView", bundle: nil)
        let ingredientsTableHeader = nib.instantiate(withOwner: nil, options: nil).first as! IngredientsTableHeaderView
        ingredientsTableHeader.autoresizingMask = [.flexibleWidth]
        ingredientsTableView.tableHeaderView = ingredientsTableHeader
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fromMeasurementView.clearTextField()
        toMeasurementView.clearTextField()
    }
    
    @IBOutlet weak var fromMeasurementView: MeasurementView!
    @IBOutlet weak var toMeasurementView: MeasurementView!
    
    @IBOutlet weak var ingredientsTableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingridients.count + 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row + 1 == tableView.numberOfRows(inSection: 0)  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddIngredientsCell", for: indexPath) as! AddIngredientsTableViewCell
            cell.delegate = self
            
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsCell", for: indexPath) as! IngredientsTableViewCell
            let ingredient = ingridients[indexPath.row]

            cell.ingredientNameLabel.text = ingredient.name
            cell.amountNameLabel.text = String(ingredient.amount)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == tableView.numberOfRows(inSection: indexPath.section) {
        }
    }
    
    func addIngredientsTapped(cell: AddIngredientsTableViewCell) {
        let ingredient = Ingredient()
        ingredient.name = cell.addIngredientTextField.text ?? ""
        ingredient.amount = Int(cell.addAmountTextField.text ?? "0") ?? 0
        ingridients.append(ingredient)
        ingredientsTableView.reloadData()
        cell.addIngredientTextField.text = ""
        cell.addAmountTextField.text = ""
        
    }
}

