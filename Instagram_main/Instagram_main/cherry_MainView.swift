//
//  MainView.swift
//  Instagram_main
//
//  Created by 채리원 on 5/31/24.
//

import SwiftUI

struct cherry_MainView: View {
    var body: some View {
        VStack {
            cherry_TopBarView()
            
            Divider()
            
            cherry_StoriesView()
            
            Divider()
            
            cherry_PostView()
            
            Divider()
            
            cherry_TabBarIView()
        }
        .padding()
    }
}


#Preview {
    cherry_MainView()
}
