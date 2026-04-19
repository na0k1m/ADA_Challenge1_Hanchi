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
                Image(.background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    let _ = print("현재프로필수:\(myCreatures.count)")
                    if let myProfile = myCreatures.first {
                        MyProfileComponent(viewModel: viewModel, myCreature: myProfile)
                            .padding(.top, 70)
                    }
                    else {
                        ProgressView()
                    }
                    FriendBookGridView(viewModel: viewModel, friendList: otherCreatures)
                        .padding(.horizontal)
                    Spacer()
                }
                VStack {
                    Spacer()
                    BottomButton(isMoveToOcean: $viewModel.isMoveToOcean)
                }
                
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
            .navigationDestination(isPresented: $viewModel.isMoveToOcean) {
                OceanView() { otherCreature in
//                    viewModel.friendList.append(otherCreature)
//                    viewModel.myCreature?.friendCount += 1
                    modelContext.insert(otherCreature)
                    
                    if let myProfile = myCreatures.first {
                        myProfile.friendCount += 1
                    }
                }
            }
            .ignoresSafeArea(.keyboard)
        }
    }
}

#Preview {
    MainHomeView()
}
