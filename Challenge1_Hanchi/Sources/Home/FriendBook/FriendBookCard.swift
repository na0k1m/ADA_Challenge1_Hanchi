//
//  FriendBookCard.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/30/26.
//

import SwiftUI

struct FriendBookCard: View {
    let friend: OtherCreature
    @Binding var showFriendDetail: Bool
    
    var onClick: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.mint.opacity(0.3))
                    .frame(width: 100)
                    .foregroundStyle(.white)
                Image(friend.creature.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
            }
            Text(friend.creature.name)
                .font(.OwnglyphMeetme.regular.font(size: 18))
                .foregroundStyle(.white)
        }
        .onTapGesture {
            showFriendDetail = true
            onClick?()
        }
    }
}

#Preview {
    @Previewable @State var showFriendDetail: Bool = false
    FriendBookCard(friend: OtherCreature(creature: Creature(name: "가녀린 한치", iconName: "bokeo"), firstMetDay: "2026.03.30", pokedCount: 1), showFriendDetail: $showFriendDetail)
}
