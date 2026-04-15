//
//  MainHomeViewModel.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/31/26.
//

import Foundation

@Observable
class MainHomeViewModel {
    var myCreature: MyCreature
    var showFriendDetail = false
    var isMoveToOcean = false
    var showPokePopup = false // 이건 나중에 빼도 될듯
    var isEditingMode = false
    
    var friendList: [OtherCreature] = [
        OtherCreature(creature: Creature(name: "배부른 복어", iconName: "bokeo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "배고픈 참치", iconName: "gamulchi"), firstMetDay: nil),
        OtherCreature(creature: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "웃긴 킼킼", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "화난 문어티비", iconName: "mooneo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "짜증내는 새우", iconName: "saewoo"), firstMetDay: "2026.03.30"),
    ]
    
    var selectedFriend: OtherCreature?
    
    init() {
        let randomType = CreatureType.allCases.randomElement() ?? .hanchi
        
        let defaultCharacter = Creature(
            name: randomType.defaultNickname,
            iconName: randomType.rawValue
        )
        
        self.myCreature = MyCreature(creature: defaultCharacter)
        self.myCreature.friendCount = friendList.count
    }
}
