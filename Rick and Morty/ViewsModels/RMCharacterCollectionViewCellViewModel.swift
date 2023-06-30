//
//  RMCharacterCollectionViewCellViewModel.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 28.06.23.
//

import Foundation

final class RMCharacterCollectionViewCellViewModel {
    public let characterName: String
    private let characterStatus: RMCharStatus
    private let characterImageUrl: URL?
    
    // MARK: - INIT
    
    init(
        characterName: String,
        characterStatus: RMCharStatus,
        characterImageUrl: URL?
    ) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return "Status: \(characterStatus.text)"
    }
    
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        completion(.failure(URLError(.badURL)))
        guard let url = characterImageUrl else {
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? URLError(.badServerResponse)))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
}
