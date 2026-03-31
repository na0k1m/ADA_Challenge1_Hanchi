//
//  FriendBookCard.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/30/26.
//

import SwiftUI

struct FriendBookCard: View {
    let friend: EncounteredCreature
    @State private var showFriendDetail = false
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.mint.opacity(0.2))
                    .frame(width: 100)
                    .foregroundStyle(.white)
                Image(friend.character.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
            }
            Text(friend.character.name)
                .font(.OwnglyphMeetme.regular.font(size: 18))
                .foregroundStyle(.white)
        }
        .onTapGesture { showFriendDetail = true }
    }
}

#Preview {
    FriendBookCard(friend: EncounteredCreature(character: Creature(name: "가녀린 한치", iconName: "bokeo"), firstMetDay: "2026.03.30", pokedCount: 1))
}
