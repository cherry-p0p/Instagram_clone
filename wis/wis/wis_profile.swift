//
//  wis_profil.swift
//  wis
//
//  Created by 이슬기 on 5/31/24.
//

import SwiftUI

struct wis_profile: View {
    // First Tab Image...
    @State var selectedTab: String = "square.grid.3x3"
    //For Smooth Sliding Effect
    @Namespace var animation
    
    //@State private var selectedButton: ButtonType? = .shape // shape 버튼을 초기 선택으로 설정
    
    /*enum ButtonType {
        case shape, video, person
    }*/
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    let imageDimension = UIScreen.main.bounds.width / 3
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
            }.padding()
            
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
                            Text("6")
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
                    }.padding(.horizontal)
                    // user info
                    VStack(alignment: .leading, spacing: 3) {
                        Text("아요단")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top, 3)
                        
                        Text("UMC 6기 아요단")
                            .font(.caption)
                    }.padding(.horizontal)
                    
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
                    }.padding(.horizontal)
                    
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
                    }.padding(.horizontal)
                    /*
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
                    }.padding(.horizontal)
                    */
                    
                    // Sticky Top Segmented Bar ...
                    HStack(spacing: 0){
                        TabBarButton(image: "square.grid.3x3", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                        TabBarButton(image: "video", isSystemImage: false, animation: animation, selectedTab: $selectedTab)
                        TabBarButton(image: "person.crop.square", isSystemImage: true, animation: animation, selectedTab: $selectedTab)
                    }
                    // Max Frame
                    .frame(height: 50, alignment: .bottom)
                    
                    ZStack{
                        
                        // I'm Simply Using One Temp View
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 4), count: 3), spacing: 4,  content: {
                            ForEach(1...6, id: \.self){index in
                                 // For Getting Width For Image
                                GeometryReader{proxy in
                                    let width = proxy.frame(in: .global).width
                                    
                                    ImageView(index: index, width: width)
                                }.frame(height: 120)
                            }
                            
                        })
                    }
                    /*
                    //grid
                    LazyVGrid(columns: columns) {
                        ForEach(0 ..< 15, id: \.self) { index in
                            Image("1주차")
                                .resizable()
                                .scaledToFill()
                                .frame(width: imageDimension, height: imageDimension)
                                .border(Color.white)
                                .clipped()
                        }
                    }*/
                }
            }
        }
    }
}

struct ImageView: View {
    var index: Int
    var width: CGFloat
    
    var body: some View {
        //Looping Image
        VStack{
            let imageName = index > 6 ? index - (6 * (index / 6)) == 0 ? 6 : index - (6 * (index / 6)) : index
            
            Image("\(imageName)주차")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: 120)
            // Image Problem
            // If use cornerradius it will slove..
                .cornerRadius(0)
        }
    }
}

struct TabBarButton: View {
    let imageDimension = UIScreen.main.bounds.width / 3
    var image: String
    //Since we're having asset Image...
    var isSystemImage: Bool
    var animation: Namespace.ID
    @Binding var selectedTab: String
    
    var body: some View{
        Button(action: {
            withAnimation(.easeInOut){
                selectedTab = image
            }
        }, label: {
            VStack(spacing: 12) {
                
                (
                    isSystemImage ? Image(systemName: image) : Image(image)
                )
                .renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28, height: 28)
                .foregroundColor(selectedTab == image ? .primary : .gray)
                
                ZStack{
                    if selectedTab == image{
                        Rectangle()
                            .fill(Color.primary)
                        // For Smooth sliding effect...
                            .matchedGeometryEffect(id: "TAB", in: animation)
                    }
                    else{
                        Rectangle()
                            .fill(Color.clear)
                    }
                }.frame(height: 1)
            }
        })
    }
}

#Preview {
    wis_profile()
}
