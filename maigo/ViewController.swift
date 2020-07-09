//
//  ViewController.swift
//  maigo
//
//  Created by hyu on R 2/07/02.
//  Copyright © Reiwa 2 hyu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var destinationField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var naviButton: UIButton!
    
    var destinationText = ""
    var titleText = ""
    var locationManager = CLLocationCoordinate2D()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.destinationField.delegate = self
        self.titleField.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        destinationField.resignFirstResponder()
        titleField.resignFirstResponder()
        destinationText = destinationField.text!
        titleText = titleField.text!
        print(destinationText)
        print(titleText)
        
        let geocoder = CLGeocoder()
              
              geocoder.geocodeAddressString(destinationText, completionHandler:{(placemarks, error) in
                  
                  if let unwrapPlacemarks = placemarks{
                      
                      if let firstPlacemark = unwrapPlacemarks.first{
                      if let location = firstPlacemark.location{
                          let targetlocation = location.coordinate
                          print(targetlocation)
                          
                          self.locationManager = targetlocation
                              
            }
           }
          }
        })
        
        return true
        
        
        
    }

    @IBAction func naviAction(_ sender: UIButton) {
        destinationField.text = ""
        titleField.text = ""
         
        
 }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMapView" {
            let toMapView = segue.destination as! MapViewController
            toMapView.annotationTitle = titleText
            toMapView.annotationLocationPoint = locationManager
        }
    }
}

