//
//  MainView.swift
//  Instagram_main
//
//  Created by 채리원 on 5/31/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            TopBarView()
            
            Divider()
            
            StoriesView()
            
            Divider()
            
            PostView()
            
            Divider()
            
            TabBarIView()
        }
        .padding()
    }
}

#Preview {
    MainView()
}
