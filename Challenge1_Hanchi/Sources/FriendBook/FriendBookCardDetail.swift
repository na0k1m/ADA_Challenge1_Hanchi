//
//  FriendBookCardDetail.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/31/26.
//

import SwiftUI

struct FriendBookCardDetail: View {
    var body: some View {
        ZStack {
            Image(.friendcardBG)
            
            VStack {
                Image(.bokeo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .offset(y: 0)
                
                VStack(alignment: .leading) {
                    Text("배고픈 복어\n")
                    Text("만난 날:  2026.03.31\n")
                    Text("찌른 횟수:  2회\n")
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
    FriendBookCardDetail()
}
