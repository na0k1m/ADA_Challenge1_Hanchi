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
}

#Preview {
    @Previewable @State var viewModel = MainHomeViewModel()
    FriendBookGridView(viewModel: viewModel)
}
