//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Felipe Filgueira on 15/01/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
