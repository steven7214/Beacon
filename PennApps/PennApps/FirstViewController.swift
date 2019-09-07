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
    @IBOutlet var viewContainer: UIView!
    
    //Map
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var status: UISegmentedControl!
    
    var rescuerView: UIView!
    var neutralView: UIView!
    
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
        locationManager.requestWhenInUseAuthorization() //change this and the info.plist to be always not inuse
        locationManager.startUpdatingLocation()
        map.tintColor = UIColor.gray
        
        let person = Person(title: "",
            locationName: "AK",
            discipline: "ind",
            coordinate: CLLocationCoordinate2D(latitude: 37.8270, longitude: -122.4230),
            status: "bob"
        )

        // coordinate: CLLocationCoordinate2D(latitude: 39.9522, longitude: -75.1932))
        
        person.changeColor(newTitle: "3")
        if #available(iOS 11.0, *) {
            map.register(PersonMarkerView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        } else {
            // print (behind iOS 11)
        }
        map.addAnnotation(person)
        
        
        rescuerView = Rescuer().view
        neutralView = Neutral().view
        viewContainer.addSubview(neutralView)
        viewContainer.addSubview(rescuerView)
    }


    @IBAction func switchViewAction(_ sender: UISegmentedControl) {
        
        
    }
}

