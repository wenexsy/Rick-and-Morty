//
//  CharListViewViewModel.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 23.06.23.
//

import Foundation

struct CharListViewViewModel {
    func fetchCharacters() {
        RMServise.shared.execute(.listCharRequest, expecting: RMGetCharsResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: "+String(model.info.count))
                print("Page result count "+String(model.results.count))

            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
