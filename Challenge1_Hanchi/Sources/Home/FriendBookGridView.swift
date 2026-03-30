//
//  FriendBookGridView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/30/26.
//

import SwiftUI

struct FriendBookGridView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var friendList = [
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "bokeo"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "배고픈 참치", iconName: "gamulchi"), firstMetDay: nil),
        EncounteredCreature(character: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "웃긴 1", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "mooneo"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "saewoo"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "haema"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "웃긴 1", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "mooneo"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "saewoo"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "웃긴 1", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "mooneo"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "saewoo"), firstMetDay: "2026.03.30"),
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(friendList) { friend in
                    FriendBookCard(friend: friend)
                }
            }
        }
    }
}

#Preview {
    FriendBookGridView()
}
