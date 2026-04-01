//
//  MainHomeView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI

struct MainHomeView: View {
    @State var viewModel: MainHomeViewModel = .init()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(.background)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    MyProfileComponent(viewModel: viewModel)
                        .padding(.top, 70)
                    FriendBookGridView(viewModel: viewModel)
                        .padding(.horizontal)
                    Spacer()
                }
                VStack {
                    Spacer()
                    BottomButton(isMoveToOcean: $viewModel.isMoveToOcean)
                }
                
                if viewModel.showFriendDetail {
                    Color.black.opacity(0.2)
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.showFriendDetail = false
                        }
                    FriendBookCardDetail(viewModel: viewModel)
                }
            }
            .navigationDestination(isPresented: $viewModel.isMoveToOcean) {
                OceanView()
            }
        }
    }
}

#Preview {
    MainHomeView()
}
