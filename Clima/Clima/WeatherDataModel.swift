//
//  WeatherDataModel.swift
//  WeatherApp
//
//  Created by Angela Yu on 24/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class WeatherDataModel {

    //Declare your model variables here
    private var _temperature: Int
    private var _condition: Int
    private var _city: String
    private var _weatherIconName: String
    
    // Properties
    public var temperature: Int {
        get {
            return _temperature
        }
        set {
            _temperature = newValue
        }
    }
    
    public var condition: Int {
        get {
            return _condition
        }
        set {
            _condition = newValue
        }
    }
    
    public var city: String {
        get {
            return _city
        }
        set {
            _city = newValue
        }
    }
    
    public var weatherIconName: String {
        get {
            return _weatherIconName
        }
        set {
            _weatherIconName = newValue
        }
    }
    
    // empty init
    
    init() {
        _temperature = 0
        _condition = 0
        _city = ""
        _weatherIconName = ""
    }
    
    // overloaded init
    init(temperature: Int, condition: Int, city: String, weatherIconName: String) {
        self._temperature = temperature
        self._condition = condition
        self._city = city
        self._weatherIconName = weatherIconName
    }
    
    
    //This method turns a condition code into the name of the weather condition image
    
    public func updateWeatherIcon() -> String {
        
    switch (_condition) {
    
        case 0...300 :
            return "tstorm1"
        
        case 301...500 :
            return "light_rain"
        
        case 501...600 :
            return "shower3"
        
        case 601...700 :
            return "snow4"
        
        case 701...771 :
            return "fog"
        
        case 772...799 :
            return "tstorm3"
        
        case 800 :
            return "sunny"
        
        case 801...804 :
            return "cloudy2"
        
        case 900...903, 905...1000  :
            return "tstorm3"
        
        case 903 :
            return "snow5"
        
        case 904 :
            return "sunny"
        
        default :
            return "dunno"
        }

    }
}
