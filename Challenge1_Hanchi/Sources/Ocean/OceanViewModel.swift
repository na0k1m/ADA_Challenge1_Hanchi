//
//  OceanViewModel.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 4/1/26.
//

import Foundation
import SwiftData

@Observable
class OceanViewModel {
    var showPokePopup = false
    var hanchiFriendList: [OtherCreature] = []
    
    init() {
        self.hanchiFriendList = [
            OtherCreature(id: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!, creature: Creature(name: "배부른 복어", iconName: "bokeo")),
            OtherCreature(creature: Creature(name: "졸린 라라", iconName: "sora")),
            OtherCreature(creature: Creature(name: "웃긴 킼킼", iconName: "kkotgae")),
            OtherCreature(creature: Creature(name: "짜증내는 새우", iconName: "saewoo")),
            OtherCreature(creature: Creature(name: "지루한 해마", iconName: "haema"))
        ]
    }
    
    var clickedCreature: OtherCreature?
    
    func addOrPokeFriend(context: ModelContext, foundCreature: OtherCreature, currentFriends: [OtherCreature]) {
        print("🔍 발견된 생물 ID: \(foundCreature.id)")
        print("📚 내 친구 목록 ID들: \(currentFriends.map { $0.id })")
        // 배열의 0번 인덱스부터 시작해서 조건을 만족하는 요소를 찾을 때까지 뒤로 이동
        if let existingFriend = currentFriends.first(where: { $0.id == foundCreature.id }) {
            existingFriend.pokedCount += 1
//            if foundCreature !== existingFriend {
//                foundCreature.pokedCount = existingFriend.pokedCount
//            }
        }
        else {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd"
            
            foundCreature.pokedCount += 1
            foundCreature.firstMetDay = formatter.string(from: Date())
            context.insert(foundCreature)
        }
        try? context.save()
    }
}
