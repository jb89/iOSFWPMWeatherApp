//
//  DaylyForecastViewController.swift
//  FWPMWeatherApp
//
//  Created by student on 02.01.16.
//  Copyright © 2016 de.fhws.k28316. All rights reserved.
//

import UIKit

class DailyForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var dayArray:Array<TimeslotMeasured>!
    
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setHeaderTextes()
    }
    
    private func setHeaderTextes() {
        var city:String
        var date:String
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.FullStyle
        date = formatter.stringFromDate(dayArray[0].dateAndTime)
        
        if let frcast = ForecastObject.instance {
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.FullStyle
            date = formatter.stringFromDate(dayArray[0].dateAndTime)
            city = "\(frcast.city.name), \(frcast.city.country)".replaceUmlauteFromEnglish()
        } else {
            date = " "
            city = "no city found"
        }
        lblCity.text = city
        lblDate.text = date
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dayArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DailyForecastTableViewCell") as! DailyForecastTableViewCell
        let timeslot:TimeslotMeasured = dayArray[indexPath.row]
        cell.setCellContent(timeslot)
        return cell
    }

    
}
