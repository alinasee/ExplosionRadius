//
//  Explosion.swift
//  BombDefeatRadius
//
//  Created by Alina Sitsko on 11.12.22.
//

import Foundation
import GoogleMaps

class Explosion {

    var redRadius: GMSCircle
    var orangeRadius: GMSCircle
    var yellowRadius: GMSCircle
    
    internal init(redRadius: GMSCircle, orangeRadius: GMSCircle, yellowRadius: GMSCircle) {
        self.redRadius = redRadius
        self.orangeRadius = orangeRadius
        self.yellowRadius = yellowRadius
    }
    
}


