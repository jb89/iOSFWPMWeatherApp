//
//  TabBarController.swift
//  FWPMWeatherApp
//
//  Created by student on 19.12.15.
//  Copyright © 2015 de.fhws.k28316. All rights reserved.
//

import Foundation
import UIKit

class TabBarController:UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func switchToForecast() {
        self.selectedIndex = 1
    }
    
}