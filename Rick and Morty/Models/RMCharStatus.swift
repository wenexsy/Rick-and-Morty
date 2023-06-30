//
//  RMCharStatus.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 22.06.23.
//

import Foundation

enum RMCharStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
    var text: String {
        switch self {
        case .alive, .dead:
            return rawValue
        case .unknown:
            return "Unknown"
        }
    }
}
