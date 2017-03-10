//
//  MapViewController.swift
//  College Profile Builder
//
//  Created by Maddy Sutton on 2/16/16.
//  Copyright © 2016 Maddy Sutton. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var mapKit: MKMapView!
    var toPass:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        textField.text = toPass
        findLocation("\(toPass)")
    }
    
    func findLocation(_ locationName: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(locationName) { (placemarks, error) -> Void in
            if error != nil  {
                print(error)
            }
            else {
                
                if placemarks!.count > 1 {
                    let alert = UIAlertController(title: "Select a Location", message: nil, preferredStyle: .actionSheet)
                    for placemark in placemarks! {
                        let locationAction = UIAlertAction(title: placemark.name!, style: .default, handler: { (action) -> Void in
                            self.displayMap(placemark)
                        })
                        alert.addAction(locationAction)
                    }
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true, completion: nil)

            }
            else if placemarks?.count == 1 {
                let placemark = placemarks!.first as CLPlacemark!
                self.displayMap(placemark!)
            }
            }
        }
    }
    
    func displayMap(_ placemark: CLPlacemark) {
        textField.text = placemark.name
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(center, span)
        let pin = MKPointAnnotation()
        pin.coordinate = center
        pin.title = placemark.name
        mapKit.addAnnotation(pin)
        mapKit.setRegion(region, animated: true)
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let locationName = textField.text!
        textField.resignFirstResponder()
        findLocation(locationName)
        return true
    }


}
