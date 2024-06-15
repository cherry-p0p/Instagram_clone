//
//  PostView.swift
//  Instagram_main
//
//  Created by 채리원 on 5/23/24.
//

import SwiftUI

struct cherry_PostView: View {
    @State private var isLikedFirstPost: Bool = false
    @State private var isLikedSecondPost: Bool = false
    @State private var isCommenting: Bool = false
    @State private var commentText: String = ""
    @State private var comments: [String] = []
    
    var body: some View {
        ScrollView {
            
            // 첫번째 게시물
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
                        Text("iOS")
                            .padding(.trailing, 50)
                            .font(.system(size: 17, weight: .bold))
                        
                        Text("Gachon Uni")
                            .font(.system(size: 15, weight: .light))
                    }
                    .padding(.trailing, 200)
                    
                    Image("Post_1")
                }
                
                // 게시물 사진
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 30) {
                        Image("Post_10")
                            .resizable()
                            .frame(width: 370, height: 370)
                        Image("Post_11")
                            .resizable()
                            .frame(width: 370, height: 370)
                        Image("Post_9")
                            .resizable()
                            .frame(width: 370, height: 370)
                    }
                }
                
                // 좋아요, 댓글, 북마크 등등
                HStack {
                    Button(action: {
                        isLikedFirstPost.toggle()
                    }) {
                        Image(isLikedFirstPost ? "Post_3_red" : "Post_3")

                    }
                    
                    Button(action: {
                        isCommenting.toggle()
                    }) {
                        Image("Post_4")
                    }
                    
                    Image("Post_5")
                    
                    Spacer()
                    
                    Image("Post_6")
                    
                    Spacer()
                    
                    Button(action: {
                        isCommenting.toggle()
                    }) {
                        Image("Post_7")
                    }
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
                    Text("iOS 스터디 뒷풀이 완료 ~ ! 🍏🍎👍🏻")
                }
                .padding(.trailing, 50)
                
                // 댓글 목록
                ForEach(comments, id: \.self) { comment in
                    HStack {
                        Text("User: ")
                            .font(.system(size: 17, weight: .bold))
                        Text(comment)
                    }
                    .padding(.trailing, 270)
                    .padding(.vertical, 3)
                }
                
                // 댓글 작성
                if isCommenting {
                    HStack {
                        TextField("댓글을 입력하세요...", text: $commentText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 10)
                        
                        Button(action: {
                            if !commentText.isEmpty {
                                comments.append(commentText)
                                commentText = ""
                                isCommenting = false
                            }
                        }) {
                            Text("게시")
                                .padding(.trailing, 10)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
            
            Divider()
            
            // 첫번째 게시물
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
                        Text("iOS")
                            .padding(.trailing, 50)
                            .font(.system(size: 17, weight: .bold))
                        
                        Text("Gachon Uni")
                            .font(.system(size: 15, weight: .light))
                    }
                    .padding(.trailing, 200)
                    
                    Image("Post_1")
                }
                
                // 게시물 사진
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 30) {
                        Image("Post_2")
                            .resizable()
                            .frame(width: 370, height: 370)
                        Image("Post_8")
                            .resizable()
                            .frame(width: 370, height: 370)
                    }
                }
                
                // 좋아요, 댓글, 북마크 등등
                HStack {
                    Button(action: {
                        isLikedFirstPost.toggle()
                    }) {
                        Image(isLikedFirstPost ? "Post_3_red" : "Post_3")

                    }
                    
                    Button(action: {
                        isCommenting.toggle()
                    }) {
                        Image("Post_4")
                    }
                    
                    Image("Post_5")
                    
                    Spacer()
                    
                    Image("Post_6")
                    
                    Spacer()
                    
                    Button(action: {
                        isCommenting.toggle()
                    }) {
                        Image("Post_7")
                    }
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
                    Text("가천대 6기 iOS 스터디 인증샷 모음 🤩")
                }
                .padding(.trailing, 50)
                
                // 댓글 목록
                ForEach(comments, id: \.self) { comment in
                    HStack {
                        Text("User: ")
                            .font(.system(size: 17, weight: .bold))
                        Text(comment)
                    }
                    .padding(.trailing, 260)
                    .padding(.vertical, 3)
                }
                
                // 댓글 작성
                if isCommenting {
                    HStack {
                        TextField("댓글을 입력하세요...", text: $commentText)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.leading, 10)
                        
                        Button(action: {
                            if !commentText.isEmpty {
                                comments.append(commentText)
                                commentText = ""
                                isCommenting = false
                            }
                        }) {
                            Text("게시")
                                .padding(.trailing, 10)
                        }
                    }
                    .padding(.vertical, 10)
                }
            }
        }
    }
}

#Preview {
    cherry_PostView()
}

