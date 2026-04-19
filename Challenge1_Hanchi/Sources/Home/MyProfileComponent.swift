//
//  MyProfileComponent.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI
import SwiftData

struct MyProfileComponent: View {
    @Bindable var viewModel: MainHomeViewModel
    @Bindable var myCreature: MyCreature
    
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
                Image(myCreature.creature.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .padding(.trailing, 30)
                
                VStack(alignment: .leading) {
                    HStack {
                        if !viewModel.isEditingMode {
                            Text(myCreature.creature.name)
                                .font(.OwnglyphMeetme.regular.font(size: 26))
                                .padding(.bottom)
                            Spacer()
                            Button(action: {
                                viewModel.startEditing(currentName: myCreature.creature.name)
                            }) {
                                Image(.pencil)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 26)
                                    .padding(.bottom)
                                    .foregroundStyle(.black)
                            }
                        }
                        else {
                            TextField("닉네임", text: $viewModel.tempNickname)
                                .font(.OwnglyphMeetme.regular.font(size: 26))
                                .textFieldStyle(.roundedBorder)
                                .frame(maxWidth: 130)
                                .onSubmit {
                                    viewModel.saveNickname(profile: myCreature)
                                }
                                .padding(.bottom)
                            
                            Button(action: {
                                viewModel.saveNickname(profile: myCreature)
                            }) {
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
                        Text("친구: \(myCreature.friendCount) 명")
                        Text("등급: \(myCreature.rank)")
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
    let mockProfile = MyCreature(creature: Creature(name: "해맑은 한치", iconName: "hanchi"), friendCount: 5)
    MyProfileComponent(viewModel: viewModel, myCreature: mockProfile)
        .modelContainer(for: [MyCreature.self, OtherCreature.self], inMemory: true)
}
