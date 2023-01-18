//
//  RMCharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Felipe Filgueira on 17/01/23.
//

import Foundation

final class RMCharacterDetailViewModel {
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
