//
//  Character.swift
//  DisQuiz
//
//  Created by Tobias Shepherd on 11/05/2022.
//

import Foundation
import SwiftUI

struct Character: Identifiable {
    let id = UUID()
    let characterID: Int
    let name: String
    let imageName: String
}

let characters = [
    Character(characterID: 1, name: "Dug", imageName: "DUG"),
    Character(characterID: 2, name: "Bambi", imageName: "BAMBI"),
    Character(characterID: 3, name: "Coco", imageName: "COCO")
]
