//
//  OceanView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/31/26.
//

import SwiftUI
import SwiftData

struct OceanView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State var viewModel: OceanViewModel = .init()
    
    var realFriends: [OtherCreature]
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: -30), count: 2)
    
    @State private var animate = false
    
    var onPokeConfirmed: ((OtherCreature) -> Void)? = nil
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(viewModel.hanchiFriendList.enumerated(), id: \.offset) { index, friend in
                        Image(friend.creature.iconName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .padding(.bottom, index % 2 == 0 ? 60 : 0)
                            .padding(.top, index % 2 == 1 ? 60 : 0)
                            .offset(y: animate ? -15 : 15)
                            .animation(
                                Animation.easeInOut(duration: 1.0)
                                    .repeatForever(autoreverses: true),
                                value: animate
                            )
                            .task {
                                self.animate = true
                            }
                            .onTapGesture {
                                let realFriend = realFriends.first(where: { $0.id == friend.id })
                                viewModel.showPokePopup = true
                                viewModel.clickedCreature = realFriend ?? friend
                            }
                    }
                }
                .padding(.top, 100)
            }
            
            if viewModel.showPokePopup {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
                    .onTapGesture {
                        viewModel.showPokePopup = false
                    }
                PokeAskingPopup(showPokePopup: $viewModel.showPokePopup, otherCreature: viewModel.clickedCreature ?? OtherCreature(creature: Creature(name: "nil", iconName: ""), firstMetDay: "nil")) { otherCreature in
                    viewModel.addOrPokeFriend(context: modelContext, foundCreature: otherCreature, currentFriends: realFriends)
                    onPokeConfirmed?(otherCreature)
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var viewModel = OceanViewModel()
    OceanView(viewModel: viewModel, realFriends: [])
}
