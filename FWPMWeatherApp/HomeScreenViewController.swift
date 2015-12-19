//
//  ViewController.swift
//  FWPMWeatherApp
//
//  Created by student on 12.12.15.
//  Copyright © 2015 de.fhws.k28316. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var txtfldInsertText: UITextField!
    @IBOutlet weak var btnGo: UIButton!

    @IBAction func actionDefaultButton(sender: UIButton) {
        _ = GetData(cityName: "Wuerzburg")
    }
    
    @IBAction func txtfldEditingChanged(sender: UITextField) {
        btnGo.hidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnGo.hidden = true
    }

    @IBAction func btnPressedOk(sender: UIButton) {
        var city:String = txtfldInsertText.text!
        city = city.stringByReplacingOccurrencesOfString("ä", withString: "ae")
            .stringByReplacingOccurrencesOfString("ö", withString: "oe")
            .stringByReplacingOccurrencesOfString("ü", withString: "ue")
            .stringByReplacingOccurrencesOfString("Ä", withString: "AE")
            .stringByReplacingOccurrencesOfString("Ö", withString: "OE")
            .stringByReplacingOccurrencesOfString("Ü", withString: "UE")
        
        _ = GetData(cityName: city)
    }

}

