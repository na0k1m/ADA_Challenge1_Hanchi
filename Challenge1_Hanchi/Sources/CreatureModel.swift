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

enum CreatureType: String, CaseIterable, Codable {
    case bokeo, gamulchi, haema, haepari, hanchi, kkotgae, mooneo, saewoo, sora
    
    var defaultNickname: String {
        switch self {
        case .bokeo: return "배부른 복어"
        case .gamulchi: return "자아없는 가물치"
        case .haema: return "당황한 해마"
        case .haepari: return "지루한 해파리"
        case .hanchi: return "해맑은 한치"
        case .kkotgae: return "웃긴 꽃게"
        case .mooneo: return "화난 문어"
        case .saewoo: return "예민한 새우"
        case .sora: return "심심한 소라"
        }
    }
}

struct MyCreature {
    var id = UUID()
    var creature: Creature
    var friendCount: Int = 0
    var rank: String {
        switch friendCount {
        case 0: return "태어나기 전"
        case 1...2: return "신비주의 은둔자"
        case 3...5: return "수줍은 탐험가"
        case 6...15: return "아카데미 마당발"
        case 16...50: return "포항의 유명인사"
        default: return "포항의 전설"
        }
    }
}

struct OtherCreature: Identifiable, Hashable {
    var id = UUID()
    var creature: Creature
    var isMet: Bool = false
    var firstMetDay: String?
    var pokedCount: Int = 0
}
