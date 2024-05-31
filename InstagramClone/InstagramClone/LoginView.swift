//
//  ContentView.swift
//  InstagramClone
//
//  Created by 이상엽 on 5/24/24.
//

import SwiftUI

struct LoginView: View {
    @State private var searchText = ""
    var body: some View {
        VStack {
            HStack{
                Button(action: {
                }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .frame(width: 25, height: 25)
                        //.padding(.top, 40)
                        //.offset(x: 0, y: -100)
                }
                Spacer()
            }
            Spacer()
            Image("InstagramLogo")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding(.bottom, 40)
            TextField("ID", text: $searchText)
                .padding()
                .cornerRadius(10)
                .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                .overlay(
                               RoundedRectangle(cornerRadius: 10) // 둥근 모서리 사각형
                                .stroke(Color.gray, lineWidth: 0.3) // 테두리 색상과 두께 지정
                           )
                
            TextField("Password", text: $searchText)
                .padding() // 텍스트필드 내부의 텍스트와 경계 사이의 패딩을 추가
                .background(Color(red: 0.98, green: 0.98, blue: 0.98)) // 배경색 지정
                .cornerRadius(10) // 둥근 모서리 적용
                .overlay(
                               RoundedRectangle(cornerRadius: 10) // 둥근 모서리 사각형
                                .stroke(Color.gray, lineWidth: 0.3) // 테두리 색상과 두께 지정
                           )
            
            HStack{
                Spacer()
                Text("Forgot password?")
                    .foregroundColor(Color.blue)
                    .font(.system(size: 16))
            }.padding()
            
                
            Button(action: {
                print("Button tapped")
            }) {
                Text("log in")
                    .frame(width: 326, height: 20)
                    .font(.system(size: 19)) // 폰트 크기
                    .fontWeight(.bold)
                    .padding()
                    .background(Color(red: 0.06, green: 0.55, blue: 1.00))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    .padding(.bottom, 50) // 하단 여백 추가
                    
            }
            
            
            HStack{
                RoundedRectangle(cornerRadius:15)
                    .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                    .frame(width: 150, height: 3)
                Spacer()
                Text("OR")
                    .foregroundColor(Color.gray)
                    
                Spacer()
                RoundedRectangle(cornerRadius:15)
                    .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                    .frame(width: 150, height: 3)
            }
            HStack(spacing: 0){
                Spacer()
                Text("Don't have an acount?")
                    .font(.system(size: 16))
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("Sign Up.  ")
                        .font(.system(size: 16)) // 폰트 크기
                        .padding()
                        .background(Color(.white))
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                }
                Spacer()
            }.padding(.top, 30)
            Spacer()
            
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
