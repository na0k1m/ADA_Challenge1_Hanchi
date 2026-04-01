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
    
    var friendList = [
        OtherCreature(creature: Creature(name: "졸린 1", iconName: "bokeo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "배고픈 참치", iconName: "gamulchi"), firstMetDay: nil),
        OtherCreature(creature: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "웃긴 1", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 1", iconName: "mooneo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 1", iconName: "saewoo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 1", iconName: "haema"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "웃긴 1", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 1", iconName: "mooneo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 1", iconName: "saewoo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "웃긴 1", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 1", iconName: "mooneo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "졸린 1", iconName: "saewoo"), firstMetDay: "2026.03.30"),
    ]
    
    var selectedFriend: OtherCreature?
    
    init(myCreature: MyCreature = .init(creature: .init(name: "바보", iconName: "hanchi"), friendCount: 0, rank: "")) {
        self.myCreature = myCreature
    }
}
