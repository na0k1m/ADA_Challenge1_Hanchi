//
//  MyProfileComponent.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI

struct MyProfileComponent: View {
    @State var name = "한치치"
    @State private var isEditingMode: Bool = false
    
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
                    .frame(width: 80)
                    .padding(.trailing, 30)
                
                VStack(alignment: .leading) {
                    HStack {
                        if !isEditingMode {
                            Text(name)
                                .font(.OwnglyphMeetme.regular.font(size: 30))
                                .padding(.bottom)
                            Spacer()
                            Button(action: { isEditingMode = true }) {
                                Image(.pencil)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .padding(.bottom)
                                    .foregroundStyle(.black)
                            } // 저장, 엑스 버튼 추가하기
                        }
                        else {
                            TextField("닉네임", text: $name)
                                .font(.OwnglyphMeetme.regular.font(size: 30))
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 130)
                                .onSubmit {
                                    isEditingMode = false
                                }
                                .padding(.bottom)
                            
                            Button(action: { isEditingMode = false }) {
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.bottom)
                                    .foregroundStyle(.black)
                            }
//                            .padding(.trailing)
                            
//                            Button(action: { isEditingMode = false }) {
//                                Image(systemName: "x.circle")
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 20)
//                                    .padding(.bottom)
//                                    .foregroundStyle(.black)
//                            }
                        }
                        
                    }
                    Group {
                        Text("친구: 1 명")
                        Text("등급: 마당발")
                    }
                    .font(.OwnglyphMeetme.regular.font(size: 23))
                    .foregroundStyle(Color(.secondaryLabel))
                }
                Spacer()
            }
            .padding(.horizontal, 50)
        }
    }
}

#Preview {
    MyProfileComponent()
}
