//
//  PostView.swift
//  Instagram_main
//
//  Created by 채리원 on 5/23/24.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    // 프로필 사진
                    ZStack {
                        Image("Stories_1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        Image("Stories_2")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }
                    
                    // 아이디, 장소
                    VStack {
                        Text ("iOS")
                            .padding(.trailing, 50)
                            .font(.system(size: 17, weight: .bold))
                        
                        Text ("Gachon Uni")
                            .font(.system(size: 15, weight: .light))
                    }
                    .padding(.trailing, 200)
                    
                    Image("Post_1")
                }
                
                // 게시물 사진
                Image("Post_2")
                    .resizable()
                    .frame(width: 370, height: 370)
                
                // 좋아요, 댓글, 북마크 등등
                HStack {
                    Image("Post_3")
                        .padding(.leading, 7)
                    Image("Post_4")
                        .padding(.leading, 5)
                    Image("Post_5")
                        .padding(.leading, 5)
                    
                    Spacer()
                    
                    Image("Post_6")
                        .padding(.trailing, 50)
                    
                    Spacer()
                    
                    Image("Post_7")
                        .padding(.trailing, 7)
                }
                .padding(5)
                
                // 좋아요 목록
                Text("umc_6th님 외 666명이 좋아합니다.")
                    .padding(.trailing, 100)
                    .font(.system(size: 17, weight: .regular))
                
                Spacer()
                
                // 게시물 내용
                HStack {
                    Text("iOS")
                        .font(.system(size: 17, weight: .bold))
                    Text("가천대 6기 iOS 최고!!")
                }
                .padding(.trailing, 160)
            }
        }
    }
}

#Preview {
    PostView()
}
