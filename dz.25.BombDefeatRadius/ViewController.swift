//
//  ViewController.swift
//  BombDefeatRadius
//
//  Created by Alina Sitsko on 11.12.22.
//

import UIKit
import GoogleMaps



class ViewController: UIViewController {
    var radius: Explosion?
    var explosionPosition: CLLocationCoordinate2D?
    
    private var power = ExplosionPower.allCases
    private var powerPicker = UIPickerView()
    @IBOutlet weak var powerInput: UITextField!
    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        powerPicker.delegate = self
        powerPicker.dataSource = self
        powerInput.inputView = powerPicker
    
    }
    
    
    private func createMarker (coordinates: CLLocationCoordinate2D){
        let marker = GMSMarker(position: coordinates)
        marker.map = mapView
        mapView.clear()
    }
    
}


extension ViewController: GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        createMarker(coordinates: coordinate)
        let camera = GMSCameraPosition(target: coordinate, zoom: mapView.camera.zoom)
        mapView.animate(to: camera)
        let circYellow = GMSCircle(position: coordinate, radius: 200000)
        circYellow.fillColor = UIColor.yellow.withAlphaComponent(0.4)
        circYellow.strokeColor = UIColor.yellow.withAlphaComponent(0.2)
        let circOrange = GMSCircle(position: coordinate, radius: 150000)
        circOrange.fillColor = UIColor.orange.withAlphaComponent(0.4)
        circOrange.strokeColor = UIColor.orange.withAlphaComponent(0.2)
        let circRed = GMSCircle(position: coordinate, radius: 100000)
        circRed.fillColor = UIColor.red.withAlphaComponent(0.4)
        circRed.strokeColor = UIColor.red.withAlphaComponent(0.2)
        circYellow.map = mapView
        circOrange.map = mapView
        circRed.map = mapView
        let bang = Explosion(redRadius: circRed, orangeRadius: circOrange, yellowRadius: circYellow)
        radius = bang
        explosionPosition = coordinate
        self.view.endEditing(true)
        
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UINavigationControllerDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return power[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        powerInput.text  = power[row].rawValue
        guard let boom = radius else { return }
        guard let coordinates = explosionPosition else { return }
        createMarker(coordinates: coordinates)
        boom.redRadius = GMSCircle(position: coordinates, radius: power[row].redDefeatRadius)
        boom.orangeRadius = GMSCircle(position: coordinates, radius: power[row].orangeDefeatRadius)
        boom.yellowRadius = GMSCircle(position: coordinates, radius: power[row].yellowDefeatRadius)
        boom.redRadius.fillColor = UIColor.red.withAlphaComponent(0.4)
        boom.redRadius.strokeColor = UIColor.red.withAlphaComponent(0.2)
        boom.orangeRadius.fillColor = UIColor.orange.withAlphaComponent(0.4)
        boom.orangeRadius.strokeColor = UIColor.orange.withAlphaComponent(0.2)
        boom.yellowRadius.fillColor = UIColor.yellow.withAlphaComponent(0.4)
        boom.yellowRadius.strokeColor = UIColor.yellow.withAlphaComponent(0.2)
        boom.yellowRadius.map = mapView
        boom.orangeRadius.map = mapView
        boom.redRadius.map = mapView
    }
    
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        power.count
    }
    
}



