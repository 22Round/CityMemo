//
//  MapView.swift
//  SwiftUI-CoreData
//
//  Created by Vakhtangi Beridze on 1/30/20.
//  Copyright © 2020 22Round. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

struct MapView:UIViewRepresentable {

    var addressString:String
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        getCoordinate(for: addressString) { (coordinates, error) in
            if error == nil {
                let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                let region = MKCoordinateRegion(center: coordinates, span: span)
                view.setRegion(region, animated: true)
            }
        }
    }
    
    func getCoordinate(for address:String, completion: @escaping (CLLocationCoordinate2D, NSError?) -> Void) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address) { (placemarks, error) in
            if error == nil {
                if let placemark = placemarks?[0], let location = placemark.location {
                    completion(location.coordinate, nil)
                    return
                }
            }
            completion(kCLLocationCoordinate2DInvalid, error as NSError?)
        }
    }
    
}
