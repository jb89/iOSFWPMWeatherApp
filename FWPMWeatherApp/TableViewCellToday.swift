//
//  TableViewCellToday.swift
//  FWPMWeatherApp
//
//  Created by student on 19.12.15.
//  Copyright © 2015 de.fhws.k28316. All rights reserved.
//

import UIKit

class TableViewCellToday: UITableViewCell {
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblMainWeather: UILabel!
    @IBOutlet weak var lblWeatherDescription: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblCloudiness: UILabel!
    @IBOutlet weak var lblWindSpeed: UILabel!
    @IBOutlet weak var lblWindDegree: UILabel!
    @IBOutlet weak var lblRainVolume: UILabel! //mm
    @IBOutlet weak var lblImage: UIImageView!
    
    func setCellContent(obj:TimeslotMeasured) {
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        formatter.timeStyle = .ShortStyle
        lblTime.text = formatter.stringFromDate(obj.dateAndTime)
        lblMainWeather.text = "- \(obj.weatherMainly): "
        lblWeatherDescription.text = obj.weatherDescription
        lblTemp.text = "\(obj.mainTempInCelsius) C°"
        lblHumidity.text = "\(obj.mainHumidity) %"
        lblCloudiness.text = "\(obj.cloudiness) %"
        let windSpdKph = ((obj.windSpeed*60)*60)/1000
        lblWindSpeed.text = "\(windSpdKph) Kph"
        lblWindDegree.text = getWindDirection(obj.windDegree)
        lblRainVolume.text = "\(obj.rainVolume) mm"
                
    }
    
    func getWindDirection(degree:Float) -> String {
        if degree >= 348.75 && degree < 22.25 {
            return "N"
        } else if degree >= 11.25 && degree < 56.25 {
            return "NE"
        } else if degree >= 56.25 && degree < 101.25 {
            return "E"
        } else if degree >= 101.25 && degree < 146.25 {
            return "SE"
        } else if degree >= 146.25 && degree < 191.25 {
            return "S"
        } else if degree >= 191.25 && degree < 236.25 {
            return "SW"
        } else if degree >= 236.25 && degree < 281.25 {
            return "W"
        } else if degree >= 281.25 && degree < 348.75 {
            return "NW"
        }
        else {
            return "NoDir"
        }
    }
    
}
