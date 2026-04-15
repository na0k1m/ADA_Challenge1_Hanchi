//
//  FriendBookGridView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/30/26.
//

import SwiftUI

struct FriendBookGridView: View {
    @Bindable var viewModel: MainHomeViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        if !viewModel.friendList.isEmpty {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.friendList) { friend in
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
    FriendBookGridView(viewModel: viewModel)
}
