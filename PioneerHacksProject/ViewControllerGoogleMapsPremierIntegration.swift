//
//  ViewControllerGoogleMapsPremierIntegration.swift
//  PioneerHacksProject
//
//  Created by Rohan Gumaste on 3/17/18.
//  Copyright © 2018 Mehul Tailang. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
class ViewControllerGoogleMapsPremierIntegration: UIViewController {
    
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var mapView: GMSMapView!
    var placesClient: GMSPlacesClient!
    var zoomLevel: Float = 15.0
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
