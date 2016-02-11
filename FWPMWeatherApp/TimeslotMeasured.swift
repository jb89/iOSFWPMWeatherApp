//
//  TimeslotMeasured.swift
//  FWPMWeatherApp
//
//  Created by student on 18.12.15.
//  Copyright © 2015 de.fhws.k28316. All rights reserved.
//

import Foundation

class TimeslotMeasured {
    var dateAndTime:NSDate
    var mainTempInKelvin:Float
    var mainHumidity:Int
    var weatherMainly:String //Könnte man auch als Enum machen
    var weatherDescription:String //Könnte man auch als Enum machen
    var weatherIcon:String
    var cloudiness:Int
    var windSpeed:Float
    var windDegree:Float
    //var windDirection --> ENUM, welches die Degree bekommt und dann errechnet, welche Himmelsrichtung gemeint ist.
    var rainVolume:Float
    // var snowVolume:Double --> GLaub das gibts nicht.
    
    init(dateAndTimeUnix:Int, mainTemp:Float, mainHumidity: Int, weatherMainly:String, weatherDescription:String, weatherIcon:String, cloudiness:Int, windSpeed:Float, windDegree:Float, rainVolume:Float) {
        self.dateAndTime = NSDate(timeIntervalSince1970: Double(dateAndTimeUnix)) //man bekommt die "dt"-Zeit aus dem JSON in Int und es wird in NSDate geparst.
        self.mainTempInKelvin = mainTemp
        self.mainHumidity = mainHumidity
        self.weatherMainly = weatherMainly
        self.weatherDescription = weatherDescription
        self.weatherIcon = weatherIcon
        self.cloudiness = cloudiness
        self.windSpeed = windSpeed
        self.windDegree = windDegree
        self.rainVolume = rainVolume
    }
    
    init() {
        self.dateAndTime = NSDate()
        self.mainTempInKelvin = 273.15
        self.mainHumidity = 1
        self.weatherMainly = "No Weather Data"
        self.weatherDescription = " "
        self.weatherIcon = " "
        self.cloudiness = 0
        self.windSpeed = 0.0
        self.windDegree = 0.0
        self.rainVolume = 0.0
    }
    
    func roundedRainVol() -> Float {
        let format = NSNumberFormatter()
        format.numberStyle = NSNumberFormatterStyle.DecimalStyle
        format.maximumFractionDigits = 1
        return Float(format.stringFromNumber(self.rainVolume)!)!
    }
    
    func getTempInCelsius() -> Float {
        let format = NSNumberFormatter()
        format.numberStyle = NSNumberFormatterStyle.DecimalStyle
        format.maximumFractionDigits = 1
        let tempInCelsius = self.mainTempInKelvin - 273.15
        return Float(format.stringFromNumber(tempInCelsius)!)!
    }
    
    func getWindDirection() -> String {
        let degree = self.windDegree
        if degree >= 348.75 && degree < 22.25 {
            return "to North"
        } else if degree >= 11.25 && degree < 56.25 {
            return "to NorthEast"
        } else if degree >= 56.25 && degree < 101.25 {
            return "to East"
        } else if degree >= 101.25 && degree < 146.25 {
            return "to SouthEast"
        } else if degree >= 146.25 && degree < 191.25 {
            return "to South"
        } else if degree >= 191.25 && degree < 236.25 {
            return "to SouthWest"
        } else if degree >= 236.25 && degree < 281.25 {
            return "to West"
        } else if degree >= 281.25 && degree < 348.75 {
            return "to NorthWest"
        }
        else {
            return "NoDir"
        }
    }
    
    func getPictureData() -> NSData {
        var data:NSData
        if let url = NSURL(string: "http://openweathermap.org/img/w/\(self.weatherIcon).png") {
            data = NSData(contentsOfURL: url)!
        } else {
            data = NSData(contentsOfURL: NSURL(string: "http://openweathermap.org/img/w/50n.png.png")!)!
        }
        return data
    }
    
    func getWindSpeedInKph() -> Int {
        let windSpdKph = ((self.windSpeed*60)*60)/1000
        return Int(windSpdKph)
    }
    
    func getTempInCelsiusAsString() -> String {
        return "\(self.getTempInCelsius())°C"
    }
    
    func getHumidityAsString() -> String {
        return "\(self.mainHumidity)%"
    }
    
    func getCloudinessAsString() -> String {
        return "\(self.cloudiness)%"
    }
    
    func getWindSpeedInKphAsString() -> String {
        return "\(self.getWindSpeedInKph()) Kph"
    }
    
    func getRainVolumeAsString() -> String {
        return "\(self.roundedRainVol()) mm"
    }
    
    
    
}
