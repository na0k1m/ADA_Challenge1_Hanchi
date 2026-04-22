//
//  MainHomeView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI
import SwiftData

struct MainHomeView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var myCreatures: [MyCreature]
    @Query var otherCreatures: [OtherCreature]
    @State var viewModel = MainHomeViewModel()
    
    func getFriendList(friendList: [OtherCreature]) -> [OtherCreature] {
        return friendList
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    if let myProfile = myCreatures.first {
                        MyProfileComponent(viewModel: viewModel, myCreature: myProfile)
                    }
                    
                    FriendBookGridView(viewModel: viewModel, friendList: otherCreatures)
                        .padding(.horizontal)
                        .scrollDismissesKeyboard(.interactively)
                }
                VStack {
                    Spacer()
                    
                    BottomButton(isMoveToOcean: $viewModel.isMoveToOcean)
                }
                .ignoresSafeArea(.container, edges: .bottom)
                
                if viewModel.showFriendDetail {
                    Color.black.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.showFriendDetail = false
                        }
                    FriendBookCardDetail(viewModel: viewModel)
                }
            }
            .task {
                viewModel.createInitialData(context: modelContext, isEmpty: myCreatures.isEmpty)
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .navigationDestination(isPresented: $viewModel.isMoveToOcean) {
                OceanView(myProfile: myCreatures.first, realFriends: otherCreatures, shouldForceRefresh: viewModel.isNicknameChanged) { discovered in
                    if let myProfile = myCreatures.first {
                        myProfile.friendCount = otherCreatures.count
                    }
                }
                .task {
                    viewModel.isNicknameChanged = false
                }
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                Image(.background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    MainHomeView()
}
