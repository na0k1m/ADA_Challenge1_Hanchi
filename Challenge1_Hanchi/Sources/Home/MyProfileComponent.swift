//
//  MyProfileComponent.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI

struct MyProfileComponent: View {
    @Bindable var viewModel: MainHomeViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 1))
                .foregroundStyle(.white)
                .background(.white.opacity(0.2))
                .padding(.horizontal, 20)
                .frame(height: 200)
            HStack {
                Spacer()
                Image(viewModel.myCreature.creature.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .padding(.trailing, 30)
                
                VStack(alignment: .leading) {
                    HStack {
                        if !viewModel.isEditingMode {
                            Text(viewModel.myCreature.creature.name)
                                .font(.OwnglyphMeetme.regular.font(size: 30))
                                .padding(.bottom)
                            Spacer()
                            Button(action: { viewModel.isEditingMode = true }) {
                                Image(.pencil)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30)
                                    .padding(.bottom)
                                    .foregroundStyle(.black)
                            }
                        }
                        else {
                            TextField("닉네임", text: $viewModel.myCreature.creature.name)
                                .font(.OwnglyphMeetme.regular.font(size: 30))
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 130)
                                .onSubmit {
                                    viewModel.isEditingMode = false
                                }
                                .padding(.bottom)
                            
                            Button(action: { viewModel.isEditingMode = false }) {
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20)
                                    .padding(.bottom)
                                    .foregroundStyle(.black)
                            }
                        }
                        
                    }
                    Group {
                        Text("친구: \(viewModel.myCreature.friendCount) 명")
                        Text("등급: \(viewModel.myCreature.rank)")
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
    @Previewable @State var viewModel = MainHomeViewModel()
    MyProfileComponent(viewModel: viewModel)
}
