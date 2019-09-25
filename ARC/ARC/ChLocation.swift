//
//  ChLocation.swift
//  ARC
//
//  Created by Pawan Kumar on 25/09/19.
//  Copyright © 2019 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

public protocol LocationDelegateARC {
    func locationUpdateFetch(latitude : Double,longitude : Double)
}

public class ChLocation : NSObject,CLLocationManagerDelegate{

    var locationManager: CLLocationManager?
    var ControllerGet : UIViewController? = nil

    public func StartLocationFetch(Controller : UIViewController){

        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.requestWhenInUseAuthorization()
        ControllerGet = Controller
        if CLLocationManager.locationServicesEnabled()
        {

            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.startUpdatingLocation()
  
        }
      
    }

   public func StopLocationFetch(){
        locationManager?.delegate = nil
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        let Delegate : LocationDelegateARC? = ControllerGet as? LocationDelegateARC
        Delegate?.locationUpdateFetch(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
    }

}





