//
//  SecondViewController.swift
//  tippy
//
//  Created by Scott Guidoboni on 1/10/18.
//  Copyright © 2018 doordontLLC. All rights reserved.
//

import UIKit
protocol secondViewControlDelegate:class {
    func changeOptionTip(tipPercentage:Int)
    
}
class SecondViewController: UIViewController {

    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var optionalTip: UITextField!
    weak var delegate: secondViewControlDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title:"Back", style: UIBarButtonItemStyle.plain,target: self, action: #selector(SecondViewController.BackButton(_ :)))
        self.navigationItem.leftBarButtonItem = newBackButton

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func BackButton(_ sender: Any) {
        delegate?.changeOptionTip(tipPercentage: Int(optionalTip.text!)!);
        navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
