//
//  ViewController.swift
//  Memorable Places
//
//  Created by Nelson Wu on 2016-06-08.
//  Copyright © 2016 Nelson Wu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var manager:CLLocationManager = CLLocationManager()

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        if activePlace == -1{
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        } else {
            let longitude = Double(places[activePlace]["lon"]!)!
            let latitude = Double(places[activePlace]["lat"]!)!
            var coord = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            var latDelta:CLLocationDegrees = 0.01
            var lonDelta:CLLocationDegrees = 0.01
            var span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
            var region = MKCoordinateRegion(center: coord, span: span)
            self.mapView.setRegion(region, animated: true)
            var annotation = MKPointAnnotation()
            annotation.coordinate = coord
            annotation.title = places[activePlace]["name"]
            self.mapView.addAnnotation(annotation)
        }
        var longPress = UILongPressGestureRecognizer(target: self, action: "longPressAction:")
        longPress.minimumPressDuration = 2
        mapView.addGestureRecognizer(longPress)
    }
    
    func longPressAction(gestureRecognizer: UIGestureRecognizer){
        // Make sure we don't register several long presses in a row
        
        if gestureRecognizer.state == UIGestureRecognizerState.Began {
            print("test2")
            var touchPoint = gestureRecognizer.locationInView(self.mapView)
            var coord = self.mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
            var annotation = MKPointAnnotation()
            annotation.coordinate = coord
            var title:String = ""
            var location = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemark, error) in
                if error == nil {
                    if let p = placemark?[0] {
                        print("test3")
                        var subThroughFare = p.subThoroughfare ?? ""
                        var throughFare = p.thoroughfare ?? ""
                        title = "\(subThroughFare) \(throughFare)"
                        print("before: \(title)")
                    }
                }
                if title == "" {
                    title = "Added \(NSDate())"
                }
                annotation.title = title
                self.mapView.addAnnotation(annotation)
                places += [["name":title, "lat":"\(coord.latitude)", "lon":"\(coord.longitude)"]]
            })
            
            
        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var userLocation = locations[0]
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        var coord = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        var latDelta:CLLocationDegrees = 0.01
        var lonDelta:CLLocationDegrees = 0.01
        var span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        var region = MKCoordinateRegion(center: coord, span: span)
        self.mapView.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

