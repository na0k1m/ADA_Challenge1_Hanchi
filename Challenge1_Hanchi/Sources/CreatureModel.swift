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
    var creature: Creature
    var friendCount: Int
    var rank: String
}

struct OtherCreature: Identifiable, Hashable {
    let id = UUID()
    var creature: Creature
    var isMet: Bool = false
    let firstMetDay: String?
    var pokedCount: Int = 0
}
