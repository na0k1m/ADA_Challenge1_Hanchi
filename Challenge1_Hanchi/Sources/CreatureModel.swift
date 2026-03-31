//
//  CreatureModel.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/26/26.
//

import Foundation

struct Creature: Hashable {
    var name: String
    var iconName: String
}

struct MyCreature {
    var character: Creature
    var friendCount: Int
    var rank: String
}

struct EncounteredCreature: Identifiable, Hashable {
    let id = UUID()
    var character: Creature
    var isMet: Bool = false
    let firstMetDay: String?
    var pokedCount: Int = 0
}
