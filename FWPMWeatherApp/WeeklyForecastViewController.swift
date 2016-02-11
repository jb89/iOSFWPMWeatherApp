//
//  WeeklyForecastViewController.swift
//  FWPMWeatherApp
//
//  Created by student on 12.12.15.
//  Copyright © 2015 de.fhws.k28316. All rights reserved.
//

/*
    Nicht vergessen bei UITableView:
        - von Table View auf StudentenViewController Delegates und DataSource ziehen!
        - Methoden überschreiben
        - usw..
*/

import UIKit

class WeeklyForecastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
/*
    Delegate: Controls how the table is displayed
    DataSource: Provides, what is displayed in the cells
*/
    
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var tableViewToday: UITableView!
    @IBOutlet weak var tableViewForecast: UITableView!
    
    var forecastObj:ForecastObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        //print("weeklyForecast Controller loaded")
        setHeaderTextes()
    }
    
    
    private func setHeaderTextes() {
        var city:String
        var date:String
        if let frcast = ForecastObject.instance {
            let formatter = NSDateFormatter()
            formatter.dateStyle = NSDateFormatterStyle.FullStyle
            date = formatter.stringFromDate(frcast.daysArray[0][0].dateAndTime)
            city = "\(frcast.city.name), \(frcast.city.country)".replaceUmlauteFromEnglish()
        } else {
            date = " "
            city = "no city found"
        }
        lblCity.text = city
        lblDate.text = date
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //print("sumberOfsectionsInTableview")
        return 1

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("numberOfRowsInSection")
        if let frcast = ForecastObject.instance {
            self.forecastObj = frcast
        } else {
            return 0
        }
        if tableView == tableViewToday {
            return forecastObj!.daysArray[0].count
        } else {
            return (forecastObj!.daysArray.count - 1) // -1 weil der erste Tag ja schon oben angezeigt wird
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //print("gettin cell..")
        if tableView == tableViewToday {
            let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellToday") as! TableViewCellToday
            let timeslot:TimeslotMeasured = forecastObj!.daysArray[0][indexPath.row]
            cell.setCellContent(timeslot)
            //print("cell setted")
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellForecast") as! TableViewCellForecast
            let oneDayArray = forecastObj!.daysArray[(indexPath.row + 1)] // + 1 weil bei .count eins abgezogen wurde
            if !oneDayArray.isEmpty {
                cell.setContentToCell(oneDayArray)
                return cell
            }
            return cell
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //hier wird der selektierte Tag an den nächsten Controller weiter gegeben
        if segue.identifier == "showDailyForecast" {
            let indexPath = tableViewForecast.indexPathForSelectedRow!
            let oneDayArray = forecastObj!.daysArray[(indexPath.row + 1)]
            let d = segue.destinationViewController as! DailyForecastViewController
            d.dayArray = oneDayArray
            tableViewForecast.deselectRowAtIndexPath(indexPath, animated: false)
            tableViewToday.deselectRowAtIndexPath(indexPath, animated: false)
        }
    }
    
    
}