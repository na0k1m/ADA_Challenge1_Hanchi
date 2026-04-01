//
//  FriendBookCardDetail.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/31/26.
//

import SwiftUI

struct FriendBookCardDetail: View {
    @Bindable var viewModel: MainHomeViewModel
    
    var body: some View {
        ZStack {
            Image(.friendcardBG)
            
            VStack {
                Image(viewModel.selectedFriend?.creature.iconName ?? "hanchi")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .offset(y: 0)
                
                VStack(alignment: .leading) {
                    Text("이름:  \(viewModel.selectedFriend?.creature.name ?? "바보탱")\n")
                    Text("만난 날:  \(viewModel.selectedFriend?.firstMetDay ?? "정보 없음")\n")
                    Text("찌른 횟수:  \(viewModel.selectedFriend?.pokedCount ?? 0)회\n")
                }
                .font(.OwnglyphMeetme.regular.font(size: 20))
                .offset(y: 40)
                .padding(.trailing, 55)
            }
            
            Button(action: { }) {
                Image(systemName: "xmark")
                    .resizable()
                    .frame(width: 13, height: 13)
                    .foregroundStyle(.black)
                    .offset(x: 105, y: -175)
            }
        }
    }
}

#Preview {
    @Previewable @State var viewModel = MainHomeViewModel()
    FriendBookCardDetail(viewModel: viewModel)
}
