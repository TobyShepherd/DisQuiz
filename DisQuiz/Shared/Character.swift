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
    Character(characterID: 1, name: "Anna", imageName: "ANNA"),
    Character(characterID: 2, name: "Ariel", imageName: "ARIEL"),
    Character(characterID: 3, name: "Bambi", imageName: "BAMBI"),
    Character(characterID: 4, name: "Buzz Lightyear", imageName: "BUZZ LIGHTYEAR"),
    Character(characterID: 5, name: "Cinderlla", imageName: "CINDERELLA"),
    Character(characterID: 6, name: "Dumbo", imageName: "DUMBO"),
    Character(characterID: 7, name: "Eeyore", imageName: "EEYORE"),
    Character(characterID: 8, name: "Elsa", imageName: "ELSA"),
    Character(characterID: 9, name: "Lightning Mcqueen", imageName: "LIGHTNING MCQUEEN"),
    Character(characterID: 10, name: "Mickey mouse", imageName: "MICKEY MOUSE"),
    Character(characterID: 11, name: "Minnie Mouse", imageName: "MINNIE MOUSE"),
    Character(characterID: 12, name: "Moana", imageName: "MOANA"),
    Character(characterID: 13, name: "Olaf", imageName: "OLAF"),
    Character(characterID: 14, name: "Piglet", imageName: "PIGLET"),
    Character(characterID: 15, name: "Rapunzel", imageName: "RAPUNZEL"),
    Character(characterID: 16, name: "Stitch", imageName: "STITCH"),
    Character(characterID: 17, name: "Sully", imageName: "SULLY"),
    Character(characterID: 18, name: "Tinkerbell", imageName: "TINKERBELL"),
    Character(characterID: 19, name: "Winnie The Pooh", imageName: "WINNIE THE POOH"),
    Character(characterID: 20, name: "Woody", imageName: "WOODY"),
    Character(characterID: 21, name: "Angel", imageName: "ANGEL"),
    Character(characterID: 22, name: "Aurora", imageName: "AURORA"),
    Character(characterID: 23, name: "Baloo", imageName: "BALOO"),
    Character(characterID: 24, name: "Belle", imageName: "BELLE"),
    Character(characterID: 25, name: "Dopey", imageName: "DOPEY"),
    Character(characterID: 26, name: "Edna Mode", imageName: "EDNA MODE"),
    Character(characterID: 27, name: "Jasmine", imageName: "JASMINE"),
    Character(characterID: 28, name: "Maleficent", imageName: "MALEFICENT"),
    Character(characterID: 29, name: "Merida", imageName: "MERIDA"),
    Character(characterID: 30, name: "Mirabel", imageName: "MIRABEL"),
    Character(characterID: 31, name: "Mowgli", imageName: "MOWGLI"),
    Character(characterID: 32, name: "Nani", imageName: "NANI"),
    Character(characterID: 33, name: "Pumba", imageName: "PUMBA"),
    Character(characterID: 34, name: "Remy", imageName: "REMY"),
    Character(characterID: 35, name: "Sebastian", imageName: "SEBASTIAN"),
    Character(characterID: 36, name: "Thumper", imageName: "THUMPER"),
    Character(characterID: 37, name: "Tiana", imageName: "TIANA"),
    Character(characterID: 38, name: "Timon", imageName: "TIMON"),
    Character(characterID: 39, name: "Ursula", imageName: "URSULA"),
    Character(characterID: 40, name: "Wall.E.", imageName: "WALL.E"),
    Character(characterID: 41, name: "Abu", imageName: "ABU"),
    Character(characterID: 42, name: "Bahgeera", imageName: "BAHGEERA"),
    Character(characterID: 43, name: "Bruce", imageName: "BRUCE"),
    Character(characterID: 44, name: "Coco", imageName: "COCO"),
    Character(characterID: 45, name: "David", imageName: "DAVID"),
    Character(characterID: 46, name: "Dug", imageName: "DUG"),
    Character(characterID: 47, name: "Emile", imageName: "EMILE"),
    Character(characterID: 48, name: "Flounder", imageName: "FLOUNDER"),
    Character(characterID: 49, name: "John", imageName: "JOHN"),
    Character(characterID: 50, name: "Joy", imageName: "JOY"),
    Character(characterID: 51, name: "Kuzco", imageName: "KUZCO"),
    Character(characterID: 52, name: "Li Shang", imageName: "LI SHANG"),
    Character(characterID: 53, name: "Marlin", imageName: "MARLIN"),
    Character(characterID: 54, name: "Meeko", imageName: "MEEKO"),
    Character(characterID: 55, name: "Michael", imageName: "MICHAEL"),
    Character(characterID: 56, name: "Mushu", imageName: "MUSHU"),
    Character(characterID: 57, name: "Nana", imageName: "NANA"),
    Character(characterID: 58, name: "Pascal", imageName: "PASCAL"),
    Character(characterID: 59, name: "Pua", imageName: "PUA"),
    Character(characterID: 60, name: "Tuk Tuk", imageName: "TUK TUK")
]
