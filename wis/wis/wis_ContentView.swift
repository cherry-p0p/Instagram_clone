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
        TabView {
            HomeView()
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
}

struct HomeView: View {
    
    var body: some View {
        Text("home")
            .font(.largeTitle)
            .padding()
    }
}

struct CommunityView: View {
    var body: some View {
        Text("search")
            .font(.largeTitle)
            .padding()
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
        Text("video")
            .font(.largeTitle)
            .padding()
    }
}

struct ProfileView: View {
    var body: some View {
        wis_profil()
    }
}

#Preview {
    wis_ContentView()
}
