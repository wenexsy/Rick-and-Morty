//
//  Extensions.swift
//  Rick and Morty
//
//  Created by Stepashka Igorevich on 23.06.23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
