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
    var rank: String {
        switch friendCount {
        case 0...2: return "신비주의 은둔자"
        case 3...5: return "수줍은 탐험가"
        case 6...15: return "포항의 유명인사"
        case 16...50: return "아카데미 마당발"
        default: return "포항의 전설"
        }
    }
}

struct OtherCreature: Identifiable, Hashable {
    let id = UUID()
    var creature: Creature
    var isMet: Bool = false
    let firstMetDay: String?
    var pokedCount: Int = 0
}
