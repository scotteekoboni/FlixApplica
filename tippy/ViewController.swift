//
//  ViewController.swift
//  tippy
//
//  Created by Scott Guidoboni on 1/10/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController,secondViewControlDelegate {
    func changeOptionTip(tipPercentage:Int) {
        tipControl.setTitle("\(tipPercentage)%", forSegmentAt: 0)
        tipPercentages[0] = Double(tipPercentage) / 100.0
        calculateTip(self)
    }

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var numberOfPeople: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentages = [0.18, 0.2, 0.25]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func settings(_ sender: Any) {
        self.performSegue(withIdentifier: "settingSeque", sender: self)
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        
        let bill = Double(billField.text!) ?? 0
        let people = Double(numberOfPeople.text!) ?? 1
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip) / people
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController
        {
            destination.delegate = self
        }
    }

}

