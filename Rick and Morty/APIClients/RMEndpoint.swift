//
//  RMEndPoint.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 22.06.23.
//

import Foundation

/// Represents unique API endpoint
@frozen enum RMEndpoint: String {
    ///Endpint to get characters, location, episode info
    case character, location, episode
    
}
