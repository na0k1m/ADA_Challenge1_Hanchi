//
//  BottomButton.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/30/26.
//

import SwiftUI

struct BottomButton: View {
    // TODO: ScrollEdgeEffect 이용해보기
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [.clear, .white]), startPoint: .top, endPoint: .bottom)
                )
                .frame(height: 200)
            Button(action: { }) {
                HStack {
                    Image(.goggle)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                    Text("한치 옆 둘러보기")
                        .font(.OwnglyphMeetme.regular.font(size: 20))
                        .foregroundStyle(Color(.systemGray))
                }
                .padding(8)
                .padding(.horizontal, 6)
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.white.opacity(0.9))
                )
            }
            .padding(.top, 50)
        }
    }
}

#Preview {
    BottomButton()
}
