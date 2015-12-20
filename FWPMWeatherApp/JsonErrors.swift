//
//  JsonErrors.swift
//  FWPMWeatherApp
//
//  Created by student on 20.12.15.
//  Copyright © 2015 de.fhws.k28316. All rights reserved.
//

import Foundation

enum JsonError: ErrorType {
    case cityNotFound(message:String)
}