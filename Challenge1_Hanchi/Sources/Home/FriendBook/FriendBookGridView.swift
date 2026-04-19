//
//  FriendBookGridView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/30/26.
//

import SwiftUI

struct FriendBookGridView: View {
    @Bindable var viewModel: MainHomeViewModel
    var friendList: [OtherCreature]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        if !friendList.isEmpty {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(friendList) { friend in
                        // Swift Closure
                        FriendBookCard(friend: friend, showFriendDetail: $viewModel.showFriendDetail) {
                            viewModel.selectedFriend = friend
                        }
                    }
                }
            }
        }
        else {
            Spacer()
            Text("친구 목록이 비어있어요.\n\n블루투스를 켜고 주변 친구들을 찾아보세요!")
                .font(.OwnglyphMeetme.regular.font(size: 25))
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            Spacer()
                .padding(.bottom, 300)
        }
    }
}

#Preview {
    @Previewable @State var viewModel = MainHomeViewModel()
    let mockFriends = [
        OtherCreature(creature: Creature(name: "배부른 복어", iconName: "bokeo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "배고픈 참치", iconName: "gamulchi"), firstMetDay: nil),
        OtherCreature(creature: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "웃긴 킼킼", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "화난 문어티비", iconName: "mooneo"), firstMetDay: "2026.03.30"),
        OtherCreature(creature: Creature(name: "짜증내는 새우", iconName: "saewoo"), firstMetDay: "2026.03.30"),
    ]
    FriendBookGridView(viewModel: viewModel, friendList: mockFriends)
}
