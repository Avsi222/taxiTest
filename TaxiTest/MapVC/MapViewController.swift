//
//  MapViewController.swift
//  TaxiTest
//
//  Created by Арсений Дорогин on 16/05/2019.
//  Copyright © 2019 Арсений Дорогин. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {

    
    var city:cities!
    let regionRadius: CLLocationDistance = 10000
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPin()
        
        let coordinateRegion = MKCoordinateRegion(center:CLLocationCoordinate2D(latitude: city!.city_latitude, longitude: city!.city_longtitude) ,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)

        
        // Do any additional setup after loading the view.
    }
    
    func addPin(){
        let cityMark = MKPointAnnotation()
        cityMark.title = city.city_name
        cityMark.coordinate = CLLocationCoordinate2D(latitude: city!.city_latitude, longitude: city!.city_longtitude)
        mapView.addAnnotation(cityMark)
    }
    //MARK: - MapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
