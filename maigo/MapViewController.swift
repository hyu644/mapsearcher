//
//  MapViewController.swift
//  maigo
//
//  Created by hyu on R 2/07/08.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapVIew: MKMapView!
    
    @IBOutlet weak var toggleSwitch: UIButton!
    
    var annotationTitle = ""
    var annotationLocationPoint = CLLocationCoordinate2D()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapVIew.delegate = self
        
     let pin = MKPointAnnotation()
        pin.coordinate = annotationLocationPoint
        pin.title = annotationTitle
        self.mapVIew.addAnnotation(pin)
        self.mapVIew.region = MKCoordinateRegion(center: annotationLocationPoint, latitudinalMeters: 500, longitudinalMeters: 500)
        
        
    }

    @IBAction func changeMapMode(_ sender: UIButton) {
        
        if mapVIew.mapType == .standard{
            mapVIew.mapType = .satellite
        }else if mapVIew.mapType == .satellite{
        mapVIew.mapType = .satelliteFlyover
        }else if mapVIew.mapType == .satelliteFlyover{
            mapVIew.mapType = .hybrid
        }else if mapVIew.mapType == .hybrid{
            mapVIew.mapType = .hybridFlyover
        }else{
            mapVIew.mapType = .standard
        }
            
        
        
    }
}
