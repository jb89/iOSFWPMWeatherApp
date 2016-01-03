//
//  DailyForecastTableViewCell.swift
//  FWPMWeatherApp
//
//  Created by student on 02.01.16.
//  Copyright © 2016 de.fhws.k28316. All rights reserved.
//

import UIKit

class DailyForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblMainWeather: UILabel!
    @IBOutlet weak var lblWeatherDescription: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblCloudiness: UILabel!
    @IBOutlet weak var lblWindSpeed: UILabel!
    @IBOutlet weak var lblWindDegree: UILabel!
    @IBOutlet weak var lblRainVolume: UILabel!
    @IBOutlet weak var lblImage: UIImageView!
    
    
    func setCellContent(obj:TimeslotMeasured) {
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.NoStyle
        formatter.timeStyle = .ShortStyle
        lblTime.text = formatter.stringFromDate(obj.dateAndTime)
        lblMainWeather.text = "- \(obj.weatherMainly): "
        lblWeatherDescription.text = obj.weatherDescription
        lblWeatherDescription.hidden = true //too much...
        lblTemp.text = "\(obj.getTempInCelsius()) C°"
        lblHumidity.text = "\(obj.mainHumidity) %"
        lblCloudiness.text = "\(obj.cloudiness) %"
        lblWindSpeed.text = "\(obj.getWindSpeedInKph()) Kph"
        lblWindDegree.text = obj.getWindDirection()
        lblRainVolume.text = obj.getRainVolumeAsString()
        lblImage.image = UIImage(data: obj.getPictureData())
        //        lblImage.setImageFromUrl("http://openweathermap.org/img/w/\(obj.weatherIcon).png")
    }
    
}
