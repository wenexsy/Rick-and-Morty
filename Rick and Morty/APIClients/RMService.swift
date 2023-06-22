//
//  RMService.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 22.06.23.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMServise {
///   shared singleton instance
    static let shared = RMServise()
    
    ///Privatized constructor
    private init() {}
    
    
    /// Send rick and morty API call:
    /// -Parameters:
    ///  -request: request instance
    ///  -completiom: Callback with data or error
    public func execute(_ request: RMRequest, completion: @escaping () -> () ) {
        
    }
}
