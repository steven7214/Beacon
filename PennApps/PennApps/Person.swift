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
    let locationName: String
    let discipline: String
    let coordinate: CLLocationCoordinate2D
    var status: String
    
    init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D, status: String) {
        self.title = title
        self.locationName = locationName
        self.discipline = discipline
        self.coordinate = coordinate
        self.status = status
        super.init()
    }
    
    var markerTintColor: UIColor  {
        switch status {
        case "emergency":
            return .red
        case "help":
            return .orange
        case "safe":
            return .green
        case "rescuer":
            return .blue
        case "neutral":
            return .gray
        default:
            return .purple
        }
    }
}
