//
//  CharListViewViewModel.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 23.06.23.
//

import UIKit

final class CharListViewViewModel: NSObject {
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
extension CharListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemRed
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
