//
//  MainHomeView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI

struct MainHomeView: View {
    @Binding var showFriendDetail: Bool
    @Binding var isMoveToOcean: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(.background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    MyProfileComponent()
                        .padding(.top, 70)
    //                Text("나의 친구 목록")
    //                    .padding(.trailing, 230)
    //                    .padding(.top)
                    FriendBookGridView(showFriendDetail: $showFriendDetail)
                        .padding(.horizontal)
                    Spacer()
                }
                VStack {
                    Spacer()
                    BottomButton(isMoveToOcean: $isMoveToOcean)
                }
                
                if showFriendDetail {
                    Color.black.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            showFriendDetail = false
                        }
                    FriendBookCardDetail()
                }
            }
        }
        .fullScreenCover(isPresented: $isMoveToOcean) {
            OceanView()
        } // 이거 추가하고 나서 화면 아래로 밀림
    }
}

#Preview {
    @Previewable @State var showFriendDetail: Bool = false
    @Previewable @State var isMoveToOcean: Bool = false
    MainHomeView(showFriendDetail: $showFriendDetail, isMoveToOcean: $isMoveToOcean)
}
