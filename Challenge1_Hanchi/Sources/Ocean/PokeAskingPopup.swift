//
//  PokeAskingPopup.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/31/26.
//

import SwiftUI

struct PokeAskingPopup: View {
    @Binding var showPokePopup: Bool
    var otherCreature: OtherCreature
    
    var onPokeConfirmed: ((OtherCreature) -> Void)? = nil
    
    var body: some View {
        VStack {
            Group {
                Text("\(otherCreature.creature.name) 콕! 찔러보기")
                    .padding(.bottom, 4)
                Text("(인사한 횟수: \(otherCreature.pokedCount)회)")
            }
            .font(.OwnglyphMeetme.regular.font(size: 20))
            
            HStack {
                Button(action: { showPokePopup = false }) {
                    Text("취소")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 30)
                        .background(.white)
                        .cornerRadius(10)
                        .foregroundStyle(.black)
                }
                Spacer().frame(width: 20)
                Button(action: {
                    onPokeConfirmed?(otherCreature)
                    showPokePopup = false
                }) {
                    Text("확인")
                        .padding(.vertical, 8)
                        .padding(.horizontal, 30)
                        .background(.white)
                        .cornerRadius(10)
                        .foregroundStyle(.black)
                }
            }
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 250, height: 150)
                .foregroundStyle(.lightblue)
        )
        .font(.OwnglyphMeetme.regular.font(size: 20))
    }
}

#Preview {
    @Previewable @State var showPokePopup: Bool = false
    PokeAskingPopup(showPokePopup: $showPokePopup, otherCreature: OtherCreature(creature: Creature(name: "바바", iconName: "kkotgae"), firstMetDay: "2026.04.01"))
}
