//
//  ExplosionPower .swift
//  BombDefeatRadius
//
//  Created by Alina Sitsko on 11.12.22.
//

import Foundation

enum ExplosionPower: String, CaseIterable {
    case five = "5 килотонн"
    case ten = "10 килотонн"
    case fifteen = "15 килотонн"
    case twenty = "20 килотонн"
    case twentyFive = "25 килотонн"
    
    var redDefeatRadius: Double {
        switch self {
        case .five:
            return 50000
        case .ten:
            return 100000
        case .fifteen:
            return 150000
        case .twenty:
            return 200000
        case .twentyFive:
            return 250000
        }
    }
    var orangeDefeatRadius: Double {
        switch self {
        case .five:
            return 100000
        case .ten:
            return 150000
        case .fifteen:
            return 200000
        case .twenty:
            return 250000
        case .twentyFive:
            return 300000
        }
    }
    
    var yellowDefeatRadius: Double {
        switch self {
        case .five:
            return 150000
        case .ten:
            return 200000
        case .fifteen:
            return 250000
        case .twenty:
            return 300000
        case .twentyFive:
            return 350000
            
        }
    }
}

