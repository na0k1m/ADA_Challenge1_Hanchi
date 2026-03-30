//
//  MainHomeView.swift
//  Challenge1_Hanchi
//
//  Created by 김나영 on 3/27/26.
//

import SwiftUI

struct MainHomeView: View {
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            MyProfileComponent()
        }
    }
}

#Preview {
    MainHomeView()
}
