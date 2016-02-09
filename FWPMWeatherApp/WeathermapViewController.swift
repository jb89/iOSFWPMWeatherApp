//
//  WeathermapViewController.swift
//  FWPMWeatherApp
//
//  Created by student on 12.12.15.
//  Copyright © 2015 de.fhws.k28316. All rights reserved.
//

import UIKit
import MapKit

class WeathermapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    var forecastObj:ForecastObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        if let frcast = ForecastObject.instance {
            self.forecastObj = frcast
            let zoomLocationCity:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: forecastObj.city.lat, longitude: forecastObj.city.lon)
            let viewRegion:MKCoordinateRegion = MKCoordinateRegion(center: zoomLocationCity, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
            mapView.setRegion(viewRegion, animated: true)
        }
        //Wenn das Objekt exisitiert, zoom zu der STadt, wenn nicht, dann zoomed default nach deutschland
        

        
    }
    
}