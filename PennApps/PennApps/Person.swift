//
//  Artwork.swift
//  PennApps
//
//  Created by Aditya Kannan on 9/7/19.
//  Copyright © 2019 Helen Dong. All rights reserved.
//

import Foundation
import MapKit

class Person: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    var status: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, status: String) {
        self.title = title
        self.coordinate = coordinate
        self.status = status
        super.init()
    }
    
   
    var markerTintColor: UIColor  {
        switch status {
        case "EMERGENCY":
            return .red
        case "AT RISK":
            return .orange
        case "UNCERTAIN":
            return .gray
        case "SAFE":
            return UIColor(red:0.09, green:0.99, blue:0.25, alpha:1.0)
        case "RESCUER":
            return UIColor(red:0.46, green:0.89, blue: 0.90, alpha:1.0)
        default:
            return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        }
    }
    
    var subtitle: String? {
        let a:String = String(format:"%.2f", coordinate.latitude)
        let b:String = String(format:"%.2f", coordinate.longitude)
        return "(" + a + ", " + " " + b + ")"
    }
}
