//
//  TableViewCellForecast.swift
//  FWPMWeatherApp
//
//  Created by student on 20.12.15.
//  Copyright © 2015 de.fhws.k28316. All rights reserved.
//
import UIKit

class TableViewCellForecast: UITableViewCell {
    
    @IBOutlet weak var lblDay: UILabel!
    
    @IBOutlet weak var lblColdestTime: UILabel!
    @IBOutlet weak var lblColdestTemp: UILabel!
    @IBOutlet weak var lblColdestRainVol: UILabel!
    @IBOutlet weak var lblColdestWindSpeed: UILabel!
    @IBOutlet weak var imgColdest: UIImageView!
    
    @IBOutlet weak var lblWarmestTime: UILabel!
    @IBOutlet weak var lblWarmestTemp: UILabel!
    @IBOutlet weak var lblWarmestRainVol: UILabel!
    @IBOutlet weak var lblWarmestWindSpeed: UILabel!
    @IBOutlet weak var imgWarmest: UIImageView!
    
    func setContentToCell(arr:Array<TimeslotMeasured>) {
        
        var coldestTemp:Float = arr[0].mainTempInKelvin
        var coldestForecast:TimeslotMeasured = arr[0]
        var warmestTemp:Float = arr[0].mainTempInKelvin
        var warmestForecast:TimeslotMeasured = arr[0]
        
        for t in arr {
            if t.mainTempInKelvin < coldestTemp {
                coldestTemp = t.mainTempInKelvin
                coldestForecast = t
            }
            if t.mainTempInKelvin > warmestTemp {
                warmestTemp = t.mainTempInKelvin
                warmestForecast = t
            }
        }
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.FullStyle
        formatter.timeStyle = NSDateFormatterStyle.NoStyle
        lblDay.text = formatter.stringFromDate(coldestForecast.dateAndTime)
        formatter.timeStyle = NSDateFormatterStyle.ShortStyle
        formatter.dateStyle = NSDateFormatterStyle.NoStyle
        
        lblColdestTime.text = formatter.stringFromDate(coldestForecast.dateAndTime)
        lblColdestTemp.text = coldestForecast.getTempInCelsiusAsString()
        lblColdestRainVol.text = coldestForecast.getRainVolumeAsString()
        lblColdestWindSpeed.text = coldestForecast.getWindSpeedInKphAsString()
        imgColdest.image = UIImage(data: coldestForecast.getPictureData())
        
        lblWarmestTime.text = formatter.stringFromDate(warmestForecast.dateAndTime)
        lblWarmestTemp.text = warmestForecast.getTempInCelsiusAsString()
        lblWarmestRainVol.text = warmestForecast.getRainVolumeAsString()
        lblWarmestWindSpeed.text = warmestForecast.getWindSpeedInKphAsString()
        imgWarmest.image = UIImage(data: warmestForecast.getPictureData())
        
        
        
        
    }
    
    
}