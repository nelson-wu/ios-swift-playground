//
//  ViewController.swift
//  Map View
//
//  Created by Nelson Wu on 2016-06-08.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManage = CLLocationManager()
    
    var latitude:CLLocationDegrees = 43.095
    var longitude:CLLocationDegrees = -79.01
        
    // Delta controls how zoomed in the map will be
    var latDelta:CLLocationDegrees = 0.01
    var lonDelta:CLLocationDegrees = 0.01
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManage.delegate = self
        locationManage.desiredAccuracy = kCLLocationAccuracyBest
        locationManage.requestWhenInUseAuthorization()
        locationManage.startUpdatingLocation()
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        var span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        var region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Niagra Falls"
        annotation.subtitle = "Ontario"
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)
        var longPress = UILongPressGestureRecognizer(target: self, action: "action:")
        longPress.minimumPressDuration = 2
        mapView.addGestureRecognizer(longPress)
        
    }

    func action(gestureRecognizer: UIGestureRecognizer){
        print("Action registered")
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        var touchCoord:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        var annotation = MKPointAnnotation()
        annotation.coordinate = touchCoord
        annotation.title = "Niagra Falls"
        annotation.subtitle = "Ontario"
        mapView.addAnnotation(annotation)
        
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        var userLocation:CLLocation = locations[0]
        var longitude = userLocation.coordinate.longitude
        var latitude = userLocation.coordinate.latitude
        var location:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        var span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        var region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        self.mapView.setRegion(region, animated: true)
        
        // Map location to address
    
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error)
            } else {
                let p = placemarks?[0] ?? "empty"
                let n = p as! CLPlacemark
                var subThroughFare:String = " "
                if(n.subThoroughfare != nil){
                    subThroughFare = n.subThoroughfare!
                }
                print(subThroughFare + " " + n.thoroughfare!)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

