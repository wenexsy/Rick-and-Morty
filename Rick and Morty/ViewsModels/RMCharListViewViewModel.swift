//
//  CharListViewViewModel.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 23.06.23.
//

import UIKit

final class RMCharListViewViewModel: NSObject {
    func fetchCharacters() {
        RMServise.shared.execute(.listCharRequest, expecting: RMGetCharsResponse.self) { result in
            switch result {
            case .success(let model):
                print("Example image url: "+String(model.results.first?.image ?? "No image"))
                print("Page result count "+String(model.results.count))
                
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}
extension RMCharListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = RMCharacterCollectionViewCellViewModel(
            characterName: "Afraz",
            characterStatus: .alive,
            characterImageUrl:URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
        )
        cell.configure(with: viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let wigth = (bounds.width - 30)/2
        return  CGSize(
            width: wigth,
            height: wigth * 1.5)
    }
    
}
