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
        OtherCreature(creature: Creature(name: "배부른 복어", iconName: "bokeo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "웃긴 킼킼", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "짜증내는 새우", iconName: "saewoo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "지루한 해마", iconName: "haema"), firstMetDay: "nil"),
    ]
    
    var clickedCreature: OtherCreature?
    
    func addNewFriend() {
        
    }
}
