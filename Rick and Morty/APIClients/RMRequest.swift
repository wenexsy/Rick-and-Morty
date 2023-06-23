//
//  RMRequest.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 22.06.23.
//

import Foundation

/// Objects that represents a single API CAll
final class RMRequest {
    //base url
    //end point
    //path components
    //query parameters
    //
    
    ///API CONSTANTS
    private struct Constants {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    ///Desired endpoint
    private let endpoint: RMEndpoint
    
    ///Rath components for Api if any
    private let pathComponents: [String]
    
    ///Consructed url for the api request in string format
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the API request in string format
    public var urlString: String {
        
        var string = Constants.baseUrl
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else { return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    public init(endpoint: RMEndpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = [])
    {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}


extension RMRequest {
    static let listCharRequest = RMRequest(endpoint: .character)
}
