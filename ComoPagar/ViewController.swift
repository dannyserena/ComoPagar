//
//  ViewController.swift
//  ComoPagar
//
//  Created by user119214 on 6/6/16.
//  Copyright © 2016 user119214. All rights reserved.
//
import Foundation
import UIKit

class ViewController: UITableViewController {

    @IBOutlet var numberParcelsField : UITextField!
    @IBOutlet var parcelsValuesField : UITextField!
    @IBOutlet var inCashValueField : UITextField!
    @IBOutlet var profitabilityField : UITextField!
    
   
    @IBAction func calculate(){
        let inCash : Double = Double(self.inCashValueField.text!)!
        let installmentNumber : Int = Int(self.numberParcelsField.text!)!
        let installmentValue : Double = Double(self.parcelsValuesField.text!)!
        let rate : Double = Double(self.profitabilityField.text!)! / 100
        
       
        
        let total : Double = Double(installmentNumber) * installmentValue
        let economyInInstallments : Double = futureValue(total, noi: installmentNumber, voi: installmentValue, rate: rate)
        let economyInCash : Double = futureValue(total - inCash, noi: installmentNumber, voi:  0.0, rate: rate)
        
        let storyBoard  = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let resultView : ResultViewController = storyBoard.instantiateViewControllerWithIdentifier("resultView") as! ResultViewController
        
        super.navigationController?.pushViewController(resultView, animated: true)
        
        if(economyInCash > economyInInstallments){
            resultView.result = "Compre a vista!"
         }
        else{
           resultView.result = "Compre a prazo!"
        
        }
        //função round faz um arredondamento no resultado
        resultView.profitability = "Taxa: \(rate)%"
        resultView.parceledEconomy = "Parcela : R$: \(round(economyInInstallments))"
        resultView.cashEconomy = "Total Economizado: R$ \(round(economyInCash))"
    }

    func futureValue(let pv:Double!, let noi:Int!, let voi:Double!, let rate:Double!) -> Double {
        return (voi - pow((rate+1), Double(noi)) * (voi - rate*pv)) / rate
    }
}

