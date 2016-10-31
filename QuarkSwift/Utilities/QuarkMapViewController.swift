//
//  MKAnnotationViewExtensions.swift
//  QuarkSwift
//
//  Created by Do Duc on 31/10/2016.
//  Copyright © 2016 maas. All rights reserved.
//

import UIKit
import MapKit

class ImageAnnotation: MKPointAnnotation {
    var image: UIImage!
    
    init(coordinate: CLLocationCoordinate2D, image: UIImage, title: String) {
        super.init()
        
        self.coordinate = coordinate
        
        self.title = title
        
        self.image = image
    }
}

class QuarkMapViewController: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? ImageAnnotation {
            let reuseId = "QuarkPin"
            
            var view = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId)
            
            if view == nil {
                view = MKAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
                view!.canShowCallout = true
                view!.calloutOffset = CGPoint(x: 0, y: 0)
            } else {
                view!.annotation = annotation
            }
            
            view?.backgroundColor = UIColor.clear
            view?.image = annotation.image
            
            return view
        }
        
        return nil
    }
}
