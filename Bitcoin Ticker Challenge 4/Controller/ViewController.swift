//
//  ViewController.swift
//  Bitcoin Ticker Challenge 4
//
//  Created by Orkun Düzgün on 29.01.2018.
//  Copyright © 2018 Orkun Duzgun. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var coinImageView: UIImageView!
    @IBOutlet weak var coinNameTV: UITextField!
    @IBOutlet weak var coinSymbolTV: UITextField!
    @IBOutlet weak var coinPriceTV: UITextField!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var currenyArray = [String]()
    var baseURL : String = "https://api.coinmarketcap.com/v1/ticker/"
    var finalURL : String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        
        currenyArray.append("Bitcoin")
        currenyArray.append("Ethereum")
        currenyArray.append("Ripple")
        currenyArray.append("Bitcoin-Cash")
        currenyArray.append("Cardano")
        currenyArray.append("Stellar")
        currenyArray.append("NEO")
        
        currencyPicker.selectRow(0, inComponent: 0, animated: true)
        currencyPicker.delegate?.pickerView!(currencyPicker, didSelectRow: 0, inComponent: 0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currenyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currenyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        finalURL = baseURL + currenyArray[row]
        print(finalURL)
        networkingJob()
    }
    
    func networkingJob() {
        Alamofire.request(finalURL).responseJSON { response in
            
            if let json = response.result.value {
                //var temp = JSON(CoinDataModel: json)
            }
        }
    }


}
