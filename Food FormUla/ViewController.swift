//
//  ViewController.swift
//  Food FormUla
//
//  Created by Sunny4ka on 6/6/17.
//  Copyright © 2017 Sunny4ka. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "IngredientsTableHeaderView", bundle: nil)
        let ingredientsTableHeader = nib.instantiate(withOwner: nil, options: nil).first as! IngredientsTableHeaderView
        
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
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsCell", for: indexPath) as! IngredientsTableViewCell
        cell.ingredientNameTextField.text = "Eggs"
        cell.amountNameTextField.text = "2"
        return cell
    }
}

