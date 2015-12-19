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
    
    @IBOutlet weak var tableViewToday: UITableView!
    
    var forecastObj:ForecastObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        print("weeklyForecast Controller loaded")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
                print("sumberOfsectionsInTableview")
        return 1

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        if tableView == tableViewToday {
            if let frcast = ForecastObject.instance {
                self.forecastObj = frcast
                return frcast.daysArray[0].count
            } else {
                return 0
            }
        }
        return 0

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("gettin cell..")
        if tableView == tableViewToday {
            let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCellToday") as! TableViewCellToday
            let timeslot:TimeslotMeasured = forecastObj!.daysArray[0][indexPath.row]
            cell.setCellContent(timeslot)
            print("cell setted")
            return cell
        }
        return UITableViewCell()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //hier wird der selektierte Tag an den nächsten Controller weiter gegeben
    }
    
    
}