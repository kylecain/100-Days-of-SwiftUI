//
//  Temperature.swift
//  UnitConverter
//
//  Created by Kyle Cain on 1/22/21.
//

import Foundation

class Temperature {
    static let type = "Temp"
    static let units = ["Celsius", "Fahrenheit", "Kelvin"]
    
    static func convert(_ from: String,_ to: String,_ input: String) -> Double {
        let f = Int(from)
        let t = Int(to)
        let i = Double(input) ?? 0
        
        if f == 0 && t == 1 {
            return ctof(d: i)
        } else if f == 0 && t == 2 {
            return ctok(d: i)
        } else if f == 1 && t == 0 {
            return ftoc(d: i)
        } else if f == 1 && t == 2 {
            return ftok(d: i)
        } else if f == 2 && t == 0 {
            return ktoc(d: i)
        } else if f == 2 && t == 1 {
            return ktof(d: i)
        }
        
        return 0
    }
    
    static func ctof(d: Double) -> Double {
        let t = Measurement(value: d, unit: UnitTemperature.celsius)
        return t.converted(to: UnitTemperature.fahrenheit).value
    }
    
    static func ctok(d: Double) -> Double {
        let t = Measurement(value: d, unit: UnitTemperature.celsius)
        return t.converted(to: UnitTemperature.kelvin).value
    }
    
    static func ftoc(d: Double) -> Double {
        let t = Measurement(value: d, unit: UnitTemperature.fahrenheit)
        return t.converted(to: UnitTemperature.celsius).value
    }
    
    static func ftok(d: Double) -> Double {
        let t = Measurement(value: d, unit: UnitTemperature.fahrenheit)
        return t.converted(to: UnitTemperature.kelvin).value
    }
    
    static func ktoc(d: Double) -> Double {
        let t = Measurement(value: d, unit: UnitTemperature.kelvin)
        return t.converted(to: UnitTemperature.celsius).value
    }
    
    static func ktof(d: Double) -> Double {
        let t = Measurement(value: d, unit: UnitTemperature.kelvin)
        return t.converted(to: UnitTemperature.fahrenheit).value
    }
}
