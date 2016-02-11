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
    @IBOutlet weak var lblResponseText: UILabel!
    @IBOutlet weak var btnDefault: UIButton!
    let errorText:String = "Some error occured... did u Spell the city correctly?"
    let successText:String = "Data loaded correctly"

    override func viewDidLoad() {
        super.viewDidLoad()
        btnGo.hidden = true
        lblResponseText.hidden = true
        lblResponseText.text = successText
        lblResponseText.textColor = UIColor.greenColor()
        btnDefault.hidden = true
    }
    
    @IBAction func actionDefaultButton(sender: UIButton) { //FOR FASTER TESTING PURPOSES..
        _ = GetData(cityName: "Wuerzburg", lblResponseTxt: lblResponseText)
    }
    
    @IBAction func txtfldEditingChanged(sender: UITextField) {
        btnGo.hidden = false
    }
    


    @IBAction func btnPressedOk(sender: UIButton) {
        var city:String = txtfldInsertText.text!
        city = city.replaceUmlauteToEnglish()

        _ = GetData(cityName: city, lblResponseTxt: lblResponseText)
        //Wanted to Switch the View to ForecastView when data is successfully loaded... but ViewController doesnt get instantiated correctly..
//        self.tabBarController?.selectedIndex = 1
//        let fcVC = self.storyboard?.instantiateViewControllerWithIdentifier("WeeklyForecastViewController")
//        self.navigationController?.pushViewController(fcVC!, animated: true)
    }

}

extension String {
    func replaceUmlauteToEnglish() -> String {
        return self.stringByReplacingOccurrencesOfString("ä", withString: "ae")
            .stringByReplacingOccurrencesOfString("ö", withString: "oe")
            .stringByReplacingOccurrencesOfString("ü", withString: "ue")
            .stringByReplacingOccurrencesOfString("Ä", withString: "AE")
            .stringByReplacingOccurrencesOfString("Ö", withString: "OE")
            .stringByReplacingOccurrencesOfString("Ü", withString: "UE")
    }
    
    func replaceUmlauteFromEnglish() -> String {
        return self.stringByReplacingOccurrencesOfString("ae", withString: "ä")
            .stringByReplacingOccurrencesOfString("oe", withString: "ö")
            .stringByReplacingOccurrencesOfString("ue", withString: "ü")
            .stringByReplacingOccurrencesOfString("AE", withString: "Ä")
            .stringByReplacingOccurrencesOfString("OE", withString: "Ö")
            .stringByReplacingOccurrencesOfString("UE", withString: "Ü")
    }
    
}


