//
//  OceanViewModel.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 4/1/26.
//

import Foundation

@Observable
class OceanViewModel {
    var showPokePopup = false
    
    var hanchiFriendList = [
        OtherCreature(creature: Creature(name: "배부른 복어", iconName: "bokeo"), firstMetDay: nil),
        OtherCreature(creature: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: nil),
        OtherCreature(creature: Creature(name: "웃긴 킼킼", iconName: "kkotgae"), firstMetDay: nil),
        OtherCreature(creature: Creature(name: "짜증내는 새우", iconName: "saewoo"), firstMetDay: nil),
        OtherCreature(creature: Creature(name: "지루한 해마", iconName: "haema"), firstMetDay: nil),
    ]
    
    var clickedCreature: OtherCreature?
    
    func poke(creature: inout OtherCreature) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        creature.pokedCount += 1
        
        if creature.isMet == false {
            creature.firstMetDay = formatter.string(from: Date())
            creature.isMet = true
        }
    }
}
