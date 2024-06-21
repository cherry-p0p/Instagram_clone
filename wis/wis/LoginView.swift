//
//  LoginView.swift
//  InstagramClone
//
//  Created by 이상엽 on 6/4/24.
//

import SwiftUI

struct LoginView: View {
    @AppStorage("email") private var storedEmail: String = ""
    @AppStorage("password") private var storedPassword: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var isSignUp: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
//                HStack {
//                    Button(action: {
//                        // 뒤로 가기 동작 (필요에 따라 구현)
//                    }) {
//                        Image(systemName: "chevron.left")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundColor(.black)
//                            .frame(width: 25, height: 25)
//                    }
//                    Spacer()
//                }
                Spacer()
                Image("InstagramLogo")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .padding(.bottom, 40)
                
                TextField("ID", text: $email)
                    .padding()
                    .cornerRadius(10)
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.3)
                    )
                    .padding(.bottom, 20)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(red: 0.98, green: 0.98, blue: 0.98))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.3)
                    )
                
                HStack {
                    Spacer()
                    Text("Forgot password?")
                        .foregroundColor(Color.blue)
                        .font(.system(size: 16))
                }
                .padding()
                
                Button(action: {
                    if isSignUp {
                        signUpButtonTapped()
                    } else {
                        loginButtonTapped()
                    }
                }) {
                    Text(isSignUp ? "Sign Up" : "Log In")
                        .frame(width: 326, height: 20)
                        .font(.system(size: 19))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color(red: 0.06, green: 0.55, blue: 1.00))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.bottom, 50)
                }
                
                HStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                        .frame(width: 150, height: 3)
                    Spacer()
                    Text("OR")
                        .foregroundColor(Color.gray)
                    Spacer()
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 0.944, green: 0.949, blue: 0.953))
                        .frame(width: 150, height: 3)
                }
                
                HStack(spacing: 0) {
                    Spacer()
                    Text(isSignUp ? "Already have an account?" : "Don't have an account?")
                        .font(.system(size: 16))
                    Button(action: {
                        isSignUp.toggle()
                    }) {
                        Text(isSignUp ? "Log In." : "Sign Up.")
                            .font(.system(size: 16))
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.blue)
                            .cornerRadius(8)
                    }
                    Spacer()
                }
                .padding(.top, 30)
                Spacer()
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("알림"), message: Text(alertMessage), dismissButton: .default(Text("확인")))
            }
            .background(
                NavigationLink(
                    destination: wis_ContentView(),//로그인 완료 후 화면전환
                    isActive: $isLoggedIn,
                    label: { EmptyView() }
                )
            )
        }
    }

    func loginButtonTapped() {
        if storedEmail.isEmpty || storedPassword.isEmpty || storedEmail != email || storedPassword != password {
            alertMessage = "이메일이나 비밀번호가 잘못되었습니다."
        } else {
            alertMessage = "로그인 성공"
            isLoggedIn = true
        }
        showAlert = true
    }

    func signUpButtonTapped() {
        if email.isEmpty || password.isEmpty {
            alertMessage = "이메일과 비밀번호를 입력하세요"
        } else if storedEmail == email {
            alertMessage = "이미 존재하는 아이디"
        } else {
            storedEmail = email
            storedPassword = password
            alertMessage = "회원가입 성공"
            isSignUp = false // 회원가입 후 로그인 화면으로 전환
        }
        showAlert = true
    }
}

struct ContentView: View {
    var body: some View {
        Text("로그인 다음화면 배치")
            .font(.largeTitle)
            .padding()
    }
}

#Preview {
    LoginView()
}
