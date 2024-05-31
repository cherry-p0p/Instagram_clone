import SwiftUI

// <<< 추가해야 할 기능>>>
// 각종 버튼들 액션 추가
//


struct ChatView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ChatHeaderView()
                ScrollView {
                    VStack(spacing: 10) {
                        MessageView(isCurrentUser: false, text: "롤 들어오셈 ㄱㄱ")
                        MessageView(isCurrentUser: true, text: "ㄱㄷㄱㄷ 나 밥만 먹고")
                        MessageView(isCurrentUser: false, text: "ㅇㅋㅇㅋ")
                        MessageView(isCurrentUser: true, text: "밥 다 먹음")
                        MessageView(isCurrentUser: true, text: "두가자~")
                        MessageView(isCurrentUser: false, text: "기릿")
                        TimestampView(timestamp: "(화) 오후 9:43")
                        MessageView(isCurrentUser: false, text: "헤이헤이")
                        MessageView(isCurrentUser: true, text: "와이와이")
                        TimestampView(timestamp: "(수) 오전 11:20")
                        MessageView(isCurrentUser: false, text: "수욜은 안됨??")
                        MessageView(isCurrentUser: false, text: "정현수 최윤후 수욜이 좋다고 그래가지고")
                        MessageView(isCurrentUser: false, text: "수욜은 프젝 바쁨??")
                        MessageView(isCurrentUser: true, text: "ㅇㅇ")
                        MessageView(isCurrentUser: true, text: "미정이긴 한데")
                        MessageView(isCurrentUser: true, text: "뭐 저녁이면 될듯 ㅇㅇ")
                        MessageView(isCurrentUser: true, text: "Maybe?")
                        MessageView(isCurrentUser: false, text: "ㅇㅋㅇ 바리바리수타")
                        TimestampView(timestamp: "(금) 오후 1:07")
                        MessageView(isCurrentUser: false, text: "내일 술 ㄱㄱ?")
                    }
                    .padding()
                }
                ChatInputView()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct ChatHeaderView: View {
    var body: some View {
        HStack {
            Button(action: {
                // Action for back button
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .padding(.leading, 16)
                    .font(.title2)
            }
            Image("test2")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(2)
                .overlay(
                    Circle()
                        .stroke(Color.green, lineWidth: 2)
                )
                .padding(.leading, 10)
            
            VStack(alignment: .leading) {
                Text("박스윗")
                    .foregroundColor(.black)
                    .font(.headline)
                Text("sweeeet_park")
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }
            
            Spacer()
            
            HStack(spacing: 20) {
                Button(action: {
                    // Action for call button
                }) {
                    Image(systemName: "phone")
                        .foregroundColor(.black)
                        .font(.title2)
                }
                
                Button(action: {
                    // Action for video call button
                }) {
                    Image(systemName: "video")
                        .foregroundColor(.black)
                        .font(.title2)
                }
            }
            .padding(.trailing, 16)
        }
        .padding(.vertical, 10)
        .background(Color.white)
        Divider()
    }
}

struct MessageView: View {
    var isCurrentUser: Bool
    var text: String
    
    var body: some View {
        HStack {
            if !isCurrentUser {
                Image("test2")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
            
            Text(text)
                .padding(10)
                .background(isCurrentUser ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isCurrentUser ? .white : .black)
                .cornerRadius(10)
                .frame(maxWidth: 250, alignment: isCurrentUser ? .trailing : .leading)
                .padding(isCurrentUser ? .leading : .trailing, 50)
        }
        .padding(isCurrentUser ? .leading : .trailing, 16)
    }
}

struct TimestampView: View {
    var timestamp: String
    
    var body: some View {
        Text(timestamp)
            .foregroundColor(.gray)
            .font(.footnote)
            .padding(.vertical, 5)
    }
}

struct ChatInputView: View {
    @State private var messageText: String = ""
    
    var body: some View {
        HStack {
            Button(action: {
                // Action for adding media
            }) {
                Image(systemName: "camera.circle.fill")
                    .font(.title)
            }
            
            TextField("메시지 보내기...", text: $messageText)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                .foregroundColor(.black)
            
            Button(action: {
                // Action for sending message
            }) {
                Image(systemName: "mic")
                    .foregroundColor(.black)
            }
            Button(action: {
                // Action for sending message
            }) {
                Image(systemName: "photo")
                    .foregroundColor(.black)
            }
            Button(action: {
                // Action for sending message
            }) {
                Image(systemName: "plus.bubble")
                    .foregroundColor(.black)
            }
        }
        .padding()
        .background(Color.white)
    }
}

#Preview {
    ChatView()
}
