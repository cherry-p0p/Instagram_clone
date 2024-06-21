//
//  MainView.swift
//  Instagram_main
//
//  Created by 채리원 on 5/31/24.
//

import SwiftUI

struct cherry_MainView: View {
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Image("TopBar_1")
                        .padding(.leading, 15)
                    Spacer()
                    Image("TopBar_2")
                        .padding(.trailing, 10)
                    NavigationLink(destination: dongdong_DMView()) {
                        Image("TopBar_3")
                            .padding(.trailing, 15)
                    }
                }
                
                Divider()
                
                cherry_StoriesView()
                
                Divider()
                
                cherry_PostView()
                
            }
            .padding()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

}


#Preview {
    cherry_MainView()
}
