//
//  ResultViewController.swift
//  ComoPagar
// primeiro exercicio
//  Created by user119214 on 6/6/16.
//  Copyright © 2016 user119214. All rights reserved.
//

import UIKit

class ResultViewController:UITableViewController{
    
    @IBOutlet var resultLabel : UILabel!
    @IBOutlet var profitabilityLable : UILabel!
    @IBOutlet var parceledEconomyLabel : UILabel!
    @IBOutlet var cashEconomyLabel : UILabel!
    
    var result : String?
    var profitability : String?
    var parceledEconomy : String?
    var cashEconomy : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()  //executa logo apos a tela ser executada
        
        self.resultLabel.text = self.result
        self.cashEconomyLabel.text = self.cashEconomy
        self.parceledEconomyLabel.text = self.parceledEconomy
        self.profitabilityLable.text = self.profitability
        
    }

}

