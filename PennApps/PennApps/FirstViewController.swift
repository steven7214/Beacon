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
    
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var status: UISegmentedControl!
    @IBOutlet weak var infoButton: UIButton!
    
    
    var timer:Timer!
    var test:Int = 0
   
    
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
            status: "bob" //change this later to represent status
        )

        // coordinate: CLLocationCoordinate2D(latitude: 39.9522, longitude: -75.1932))
        if #available(iOS 11.0, *) {
            map.register(PersonMarkerView.self,
                         forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        } else {
            print("behind iOS 11")
        }
        
        let allPeople = PersonList(numPerson: 10, minLat: 37.5, maxLat: 37.9, minLong: -122.5, maxLong: -122.4)
        
        let people = allPeople.generateList()
        
        for p in people {
            map.addAnnotation(p)
        }
        map.addAnnotation(person)
        timer = Timer.scheduledTimer(timeInterval:1, target: self, selector: #selector(testing), userInfo: nil, repeats: true)
        

    }
    
    @objc func testing() {
        test += 1
        if (test > 5) {
            timer.invalidate()
        }
        print(test)
    }
    
    @IBAction func statusBarChange(_ sender: UISegmentedControl) {
        switch status.selectedSegmentIndex {
        case 0:
            map.tintColor = UIColor.red
        case 1:
            map.tintColor = UIColor.orange
        case 2:
            map.tintColor = UIColor.gray
        case 3:
            map.tintColor = UIColor(red:0.09, green:0.99, blue:0.25, alpha:1.0)
        case 4:
            map.tintColor = UIColor(red:0.46, green:0.89, blue: 0.90, alpha:1.0)
        default:
            break
        }
    }
    
    @IBAction func infoButton(_ sender: AnyObject) {
        
    }
    
    
    
    @IBAction func loadInfo(_ sender: UIButton) {
        test += 1
        print(test)

    }
    
    
    
    

}
