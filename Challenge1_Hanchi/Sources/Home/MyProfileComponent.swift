//
//  MyProfileComponent.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI

struct MyProfileComponent: View {
    var body: some View {
        HStack {
            Spacer()
            Image(.hanchi)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .padding(.trailing, 50)
            
            VStack(alignment: .leading){
                HStack {
                    Text("한치치")
                        .font(.OwnglyphMeetme.regular.font(size: 40))
                        .padding(.bottom)
                    Button(action: { }) {
                        Image(.pencil)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .padding(.bottom)
                    }
                }
                Group {
                    Text("친구: 1 명")
                    Text("등급: 마당발")
                }
                .font(.OwnglyphMeetme.regular.font(size: 25))
                .foregroundStyle(Color(.secondaryLabel))
            }
            Spacer()
        }
        .padding(.vertical, 40)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 2))
                .foregroundStyle(.white)
                .padding(.horizontal)
        )
    }
}

#Preview {
    MyProfileComponent()
}
