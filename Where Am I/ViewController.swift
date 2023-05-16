//
//  ViewController.swift
//  Where Am I
//
//  Created by Gustavo Mendonca on 08/05/23.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate,CLLocationManagerDelegate{
    
    @IBOutlet weak var mapa: MKMapView!
    
    var gerenciadorLocal = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
       


}

    // como ver o usuario se movendo
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
    
    let localizacaoUsuario: CLLocation = locations.last!
    
    let latitude: CLLocationDegrees = localizacaoUsuario.coordinate.latitude
    let longitude: CLLocationDegrees = localizacaoUsuario.coordinate.longitude

    let deltaLatitude: CLLocationDegrees = 0.01
    let deltaLongitude: CLLocationDegrees = 0.01
    
    let localizacao: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
    
    
    
    let areaVisualizacao: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: deltaLatitude, longitudeDelta: deltaLongitude)
    
    let regiao: MKCoordinateRegion = MKCoordinateRegion(center: localizacao, span: areaVisualizacao)
    
    mapa.setRegion(regiao, animated: true)
}
}

