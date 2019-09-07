//
//  FirstViewController.swift
//  PennApps
//
//  Created by Helen Dong on 9/6/19.
//  Copyright © 2019 Helen Dong. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    //Map
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var status: UISegmentedControl!
    
    
    let locationManager = CLLocationManager()
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        locationManager.stopUpdatingLocation()

       let location = locations[0]
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1,longitudeDelta: 0.1)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        map.setRegion(region, animated: true)
        self.map.showsUserLocation = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        map.tintColor = UIColor.green
        let samplePoint = Artwork(title: "Pittsburgh", locationName: "Pittsburgh", discipline: "City", coordinate: CLLocationCoordinate2D(latitude: 40.4406, longitude: 79.9959))
        map.addAnnotation(samplePoint)
    }


}

