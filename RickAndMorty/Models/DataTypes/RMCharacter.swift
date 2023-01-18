//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by Felipe Filgueira on 03/01/23.
//

import Foundation

struct RMCharacter: Codable {
      let id: Int
      let name: String
      let status: RMCharacterStatus
      let species: String
      let type: String
      let gender: RMCharacterGender
      let origin: RMOrigin
      let location: RMSigleLocation
      let image: String
      let episode: [String]
      let url: String
      let created: String
}

