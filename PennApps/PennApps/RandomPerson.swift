//
//  RandomPerson.swift
//  PennApps
//
//  Created by Aditya Kannan on 9/7/19.
//  Copyright © 2019 Helen Dong. All rights reserved.
//

import Foundation
import MapKit

class PersonList {
    var plist: [Person] = []
    let numPerson: Int
    let minLat: Double
    let maxLat: Double
    let minLong: Double
    let maxLong: Double
    
    init(numPerson: Int, minLat: Double, maxLat: Double, minLong: Double, maxLong: Double) {
        self.numPerson = numPerson
        self.minLat = minLat
        self.maxLat = maxLat
        self.minLong = minLong
        self.maxLong = maxLong
    }
    
    func generateRandomPerson() -> Person {
        let lat = Double.random(in: minLat ..< maxLat)
        let long = Double.random(in: minLong ..< maxLong)
        
        let randStatus = Double.random(in: 0 ..< 1)
        var stat = ""
        if (randStatus < 0.1) {
            stat = "emergency"
        } else if (0.1 < randStatus && randStatus < 0.5) {
            stat = "help"
        } else if (0.5 < randStatus && randStatus < 0.7) {
            stat = "neutral"
        } else if (0.7 < randStatus && randStatus < 0.9) {
            stat = "safe"
        } else {
            stat = "rescuer"
        }
        
        
       //add information stuff here
        return Person(title: stat, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long), status: stat)
    }
    
    func generateList() -> [Person] {
        for _ in 1 ... numPerson {
            plist.append(generateRandomPerson())
        }
        
        return plist
    }

}
