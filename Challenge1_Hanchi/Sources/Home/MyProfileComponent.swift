//
//  MyProfileComponent.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI

struct MyProfileComponent: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 1))
                .foregroundStyle(.white)
                .background(.mint.opacity(0.1))
                .padding(.horizontal, 20)
                .frame(height: 200)
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
                            .font(.OwnglyphMeetme.regular.font(size: 35))
                            .padding(.bottom)
                        Button(action: { }) {
                            Image(.pencil)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .padding(.bottom)
                                .foregroundStyle(.black)
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
        }
    }
}

#Preview {
    MyProfileComponent()
}
