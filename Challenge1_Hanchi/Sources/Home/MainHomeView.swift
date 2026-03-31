//
//  MainHomeView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI

struct MainHomeView: View {
    @Binding var showFriendDetail: Bool
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                MyProfileComponent()
                    .padding(.top, 70)
                FriendBookGridView(showFriendDetail: $showFriendDetail)
                    .padding(.horizontal)
                Spacer()
            }
            VStack {
                Spacer()
                BottomButton()
            }
            
            if showFriendDetail {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation { showFriendDetail = false }
                    }
                FriendBookCardDetail()
                let _ = print("클릭됨")
            }
        }
    }
}

#Preview {
    @Previewable @State var showFriendDetail: Bool = false
    MainHomeView(showFriendDetail: $showFriendDetail)
}
