//
//  RMCharacterViewController.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 22.06.23.
//

import UIKit

///Controllers to show and search for characters 
final class RMCharacterViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        RMServise.shared.execute(.listCharRequest, expecting: RMGetCharsResponse.self) { result in
            switch result {
            case .success(let model):
                print("Total: "+String(model.info.count))
                print("Page result count"+String(model.results.count))

            case .failure(let error):
                print(String(describing: error))
            }
        }
        
//        let request = RMRequest(endpoint: .character,
//                                queryParameters: [
//                                    URLQueryItem(name: "name", value: "rick")
//                                ]
//        )
//        print(request.url)
//        
//        RMServise.shared.execute(request, expecting: RMCharacter.self) { result in
//            switch result {
//            case .success:
//                break
//            case .failure(let error):
//                print(String(describing: error))
//            }
//        }
    }
}


