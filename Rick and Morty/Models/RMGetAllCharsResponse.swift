//
//  RMGetCharsResponse.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 23.06.23.
//

import Foundation

struct RMGetCharsResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results:[RMCharacter]
}
