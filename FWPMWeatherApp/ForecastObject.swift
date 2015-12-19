//
//  ForecastObject.swift
//  FWPMWeatherApp
//
//  Created by student on 18.12.15.
//  Copyright © 2015 de.fhws.k28316. All rights reserved.
//

import Foundation

class ForecastObject {
    var city:City //eine Stadt für die die App die Daten hält
    //var days:[Day] //Alle Tage der Vorhersage
    //var daysAndWeather = Dictionary<String, Array<TimeslotForecast>>()
    //var daysAndForecasts = Dictionary<Int, Array<TimeslotForecast>>()
    //    var daysArray = Array<Array<TimeslotForecast>>()
    var daysArray = Array(count: 5, repeatedValue: Array<TimeslotMeasured>())
    
    static var instance:ForecastObject?
    
    
    private init(city:City) {
        self.city = city
    }
    
    class func sharedInstance(city: City) -> ForecastObject {
        self.instance = (self.instance ?? ForecastObject(city: city))
        return self.instance!
    }
    
}