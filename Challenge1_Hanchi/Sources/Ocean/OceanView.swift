//
//  OceanView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/31/26.
//

import SwiftUI

struct OceanView: View {
    @Environment(\.dismiss) private var dismiss
    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)
    var friendList = [
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "bokeo"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "배고픈 참치", iconName: "gamulchi"), firstMetDay: nil),
        EncounteredCreature(character: Creature(name: "졸린 라라", iconName: "sora"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "웃긴 1", iconName: "kkotgae"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "mooneo"), firstMetDay: "2026.03.30"),
        EncounteredCreature(character: Creature(name: "졸린 1", iconName: "saewoo"), firstMetDay: "2026.03.30"),
    ]
    
    @State private var animate = false
    
    var body: some View {
        ZStack {
            Button( action: { dismiss() }) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .frame(width: 200)
                    .foregroundStyle(.red)
            } // 이거 안보여
            .zIndex(0)
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0) {
                    ForEach(friendList.enumerated(), id: \.offset) { index, friend in
                        Image(.bokeo)
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
                    }
                }
            }
//            .padding(.top, 100)
        }
    }
}

#Preview {
    OceanView()
}
