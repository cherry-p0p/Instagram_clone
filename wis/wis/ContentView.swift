//
//  ContentView.swift
//  week7
//
//  Created by 이슬기 on 5/23/24.
//

import SwiftUI

struct ContentView: View {
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
    @State private var selectedButton: ButtonType? = .shape // shape 버튼을 초기 선택으로 설정
    
    enum ButtonType {
        case shape, video, person
    }
    var body: some View {
        VStack{
            // nav bar
            HStack{
                Button(action: {
                    
                }){
                    Image("lock")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 15, height: 15)
                    Text("6th_UMC_iOS")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .bold()
                    
                    Image(systemName: "chevron.down")
                        .font(.caption)
                }
                
                Spacer()
                
                Button(action: {
                    
                }){
                    Image("threads")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, 10)
                }
                
                Button(action: {
                    
                }){
                    Image("plus")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(.horizontal, 10)
                }
                
                Button(action: {
                    
                }){
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .padding(.leading, 10)
                }
            }
            
            ScrollView{
                VStack(alignment: .leading){
                    // profile image + status
                    HStack{
                        Image("profil")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 90, height: 90)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        VStack(spacing: 2){
                            Text("5")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("게시물")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("309")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("팔로워")
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("312")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("팔로잉")
                                .font(.caption)
                        }.padding(.trailing, 30)
                    }
                    // user info
                    VStack(alignment: .leading, spacing: 3) {
                        Text("아요단")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top, 3)
                        
                        Text("UMC 6기 아요단")
                            .font(.caption)
                    }
                    
                    // action buttons
                    HStack{
                        Button(action: {}){
                            Text("프로필 편집")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .frame(width: 156, height: 32)
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.systemGray5)))
                        }
                        Button(action: {}){
                            Text("프로필 공유")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .frame(width: 156, height: 32)
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.systemGray5)))
                        }
                        Button(action: {}){
                            Image(systemName: "person.badge.plus")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .frame(width: 34, height: 32)
                                .background(RoundedRectangle(cornerRadius: 8)
                                    .fill(Color(.systemGray5)))
                        }
                    }
                    
                    // story
                    ScrollView(.horizontal){
                        HStack{
                            VStack(spacing: 10){
                                Image("1주차")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle()
                                        .stroke(Color(.systemGray4), lineWidth: 8))
                                    .overlay(Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .frame(width: 56, height: 56))
                                Text("스터디 인증")
                                    .font(.footnote)
                            }.padding(.all, 10)
                            
                            VStack(spacing: 10){
                                Image("스터디 이벤트")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle()
                                        .stroke(Color(.systemGray4), lineWidth: 8))
                                    .overlay(Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .frame(width: 56, height: 56))
                                Text("스터디 이벤트")
                                    .font(.footnote)
                            }.padding(.all, 10)
                            
                            VStack(spacing: 10){
                                Text("+")
                                    .font(.system(size: 40))
                                    .fontWeight(.thin)
                                    .frame(width: 60, height: 60)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .overlay(Circle()
                                        .stroke(Color(.systemGray4), lineWidth: 8))
                                    .overlay(Circle()
                                        .stroke(Color.white, lineWidth: 4)
                                        .frame(width: 56, height: 56))
                                Text("새로 만들기")
                                    .font(.footnote)
                            }.padding(.all, 10)
                        }
                    }
                    
                    // media type
                    HStack(alignment: .center, spacing: 0){
                        Button(action:{
                            selectedButton = .shape
                        }){
                            ZStack{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: UIScreen.main.bounds.width / 3 - 10, height: 40)
                                Image(systemName: "squareshape.split.3x3")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(selectedButton == .shape ? .black : .gray)
                            }
                        }
                        
                        Button(action:{
                            selectedButton = .video
                        }){
                            ZStack{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: UIScreen.main.bounds.width / 3 - 10)
                                Image("video")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(selectedButton == .video ? .black : .gray)
                            }
                        }
                        
                        Button(action:{
                            selectedButton = .person
                        }){
                            ZStack{
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: UIScreen.main.bounds.width / 3 - 10)
                                Image(systemName: "person.crop.square")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(selectedButton == .person ? .black : .gray)
                            }
                        }
                    }
                    
                }
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
