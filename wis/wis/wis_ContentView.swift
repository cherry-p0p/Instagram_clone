//
//  ContentView.swift
//  week7
//
//  Created by 이슬기 on 5/23/24.
//

import SwiftUI

struct wis_ContentView: View {
    init() {
        // Customize the appearance of the tab bar
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationView {
            TabView {
                cherry_MainView()
                    .tabItem {
                        Image("home")
                    }
                
                CommunityView()
                    .tabItem {
                        Image("search")
                    }
                
                NearbyView()
                    .tabItem {
                        Image("plus")
                    }
                
                ChatView()
                    .tabItem {
                        Image("video")
                    }
                
                ProfileView()
                    .tabItem {
                        Image("tabProfil")
                    }
            }
            .accentColor(.black) // This sets the color for the selected tab item
        }
        .navigationBarBackButtonHidden(true) // 상단의 뒤로가기 버튼을 숨김
    }
}

struct HomeView: View {
    
    var body: some View {
        cherry_MainView()
    }
}

struct CommunityView: View {
    var body: some View {
        SearchView()
    }
}

struct NearbyView: View {
    var body: some View {
        Text("plus")
            .font(.largeTitle)
            .padding()
    }
}

struct ChatView: View {
    var body: some View {
        ReelsView()
    }
}

struct ProfileView: View {
    var body: some View {
        wis_profile()
    }
}

#Preview {
    wis_ContentView()
}
