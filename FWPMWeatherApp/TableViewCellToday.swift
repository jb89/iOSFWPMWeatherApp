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
        lblRainVolume.text = "\(obj.rainVolume) mm"
        lblImage.image = UIImage(data: obj.getPictureData())
//        lblImage.setImageFromUrl("http://openweathermap.org/img/w/\(obj.weatherIcon).png")
    }
    

    

}

//getPictureData ist zwar ein Synchroner Aufruf, allerdings Funktinoniert dieser wenigstens... Die Extension von UIImageView ist asynchron, aber läd nicht alle bilder.... Keine Ahnung warum.
extension UIImageView {
    public func setImageFromUrl(urlString:String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            let session = NSURLSession(configuration: config)
            session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }).resume()
        }
    }
}
