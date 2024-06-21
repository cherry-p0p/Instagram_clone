import SwiftUI

struct dongdong_DMView: View {
    var body: some View {
        VStack(spacing: 0) {
            DM_HeaderView()
            DM_MessageListView()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}


struct DM_HeaderView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .padding(.leading, 18)
                    .font(.system(size: 25))
                    .fontWeight(.semibold)
            }
            
            Text("ssub_2_")
                .font(.title2)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .padding(.leading, 1)
            
            Image(systemName: "chevron.down")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
                .padding(.leading, 1)
                .frame(width: 13, height: 13)
                .bold()
            
            Spacer()
            
            Image(systemName: "square.and.pencil")
                .foregroundColor(.black)
                .padding(.trailing, 16)
                .font(.title2)
                .fontWeight(.semibold)
        }
        .padding(.vertical, 12)
    }
}

struct DM_SearchBarView: View {
    @Binding var DM_searchText: String
    
    var body: some View {
        HStack {
            TextField("🔍 검색", text: $DM_searchText)
                .padding(8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .foregroundColor(.black)
                .padding(.horizontal, 16)
        }
        .padding(.bottom, 15)
    }
}

struct DM_MemoView: View {
    var DM_memos: [DM_Memo]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ZStack {
                HStack(spacing: 10) {
                    ForEach(DM_memos) { DM_memo in
                        VStack {
                            Image(DM_memo.imageName)
                                .resizable()
                                .frame(width: 70, height: 70)
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.gray, lineWidth: 1)
                                )
                                .overlay(
                                    Text(DM_memo.userMemo)
                                        .bold()
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                        .padding(4)
                                        .background(Color.black.opacity(0.7))
                                        .clipShape(Capsule())
                                        .offset(y: -5),
                                    alignment: .top
                                )
                            
                            Text(DM_memo.name)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .font(.body)
                        }
                        .frame(width: 80, height: 110)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

struct DM_MessageListView: View {
    @State private var DM_searchText = ""
    
    var body: some View {
        ScrollView {
            VStack {
                DM_SearchBarView(DM_searchText: $DM_searchText)
                DM_MemoView(DM_memos: DM_memos)
                
                HStack {
                    Text("메시지")
                        .font(.system(size: 18))
                        .bold()
                    
                    Spacer()
                    
                    Text("요청")
                        .font(.headline)
                        .foregroundColor(.gray)
                        
                }
                .padding(.horizontal, 15)
                .padding(.top, 10)
                
                ForEach(DM_messages.filter { DM_message in
                    DM_searchText.isEmpty || DM_message.name.contains(DM_searchText)
                }) { DM_message in
                    DM_MessageRowView(DM_message: DM_message)
                }
            }
            .padding(.top, 8)
        }
    }
}

struct DM_MessageRowView: View {
    var DM_message: DM_Message
    
    var body: some View {
        HStack {
            if DM_message.storyOn {
                if DM_message.bf {
                    NavigationLink (destination: dongdong_DMChatView(userName: DM_message.name)) {
                        
                        Image(DM_message.imageName)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(2)
                            .overlay(
                                Circle()
                                    .stroke(Color.green, lineWidth: 2)
                            )
                            .padding(.leading, 16)
                    }
                    
                }
                else {
                    NavigationLink (destination: dongdong_DMChatView(userName: DM_message.name)) {
                        
                        Image(DM_message.imageName)
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            .padding(2)
                            .overlay(
                                Circle()
                                    .stroke(
                                        LinearGradient(gradient: Gradient(colors: [.pink, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing),
                                        lineWidth: 2
                                    )
                                    .padding(2)
                            )
                            .padding(.leading, 16)
                    }
                }
            }
            else {
                NavigationLink (destination: dongdong_DMChatView(userName: DM_message.name)) {
                    Image(DM_message.imageName)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .padding(2)
                        .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 2)
                                .padding(2)
                        )
                        .padding(.leading, 16)
                }
                
            }
            
            VStack(alignment: .leading) {
                NavigationLink(destination: dongdong_DMChatView(userName: DM_message.name)) {
                    Text(DM_message.name)
                        .foregroundColor(.black)
                        .font(.body)
                        .bold()
                }
                
                if DM_message.isRead {
                    Text(DM_message.time)
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                else {
                    HStack {
                        Text(DM_message.talk)
                            .foregroundColor(.gray)
                            .font(.footnote)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        
                        Text(DM_message.time)
                            .foregroundColor(.gray)
                            .font(.footnote)
                        
                    }
                }
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Button(action: {
                // Action for call button
            }) {
                Image(systemName: "camera")
                    .font(.system(size: 20))
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                    .padding(.trailing, 16)
                    .bold()
            }
        }
        .padding(.vertical, 8)
    }
}

struct DM_Memo: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let userMemo: String
}

struct DM_Message: Identifiable {
    let id = UUID()
    let imageName: String
    let storyOn: Bool
    let bf: Bool
    let name: String
    let isRead: Bool
    let talk: String
    let time: String
}

let DM_memos = [
    DM_Memo(imageName: "DM_test9", name: "김장발", userMemo: "날씨 좋네"),
    DM_Memo(imageName: "DM_test11", name: "황보곰", userMemo: "졸리당"),
    DM_Memo(imageName: "DM_test1", name: "정멍뭉", userMemo: "배고픈데?"),
    DM_Memo(imageName: "DM_test8", name: "오간지", userMemo: "Hello"),
    DM_Memo(imageName: "DM_test4", name: "김아요", userMemo: "아 뭐 먹지"),
    DM_Memo(imageName: "DM_test5", name: "이치킨", userMemo: "심심하다..")
]

let DM_messages = [
    DM_Message(imageName: "DM_test1", storyOn: true, bf: false, name: "정멍뭉",isRead: false, talk: "ㅇㅋㅇㅋ 나 가게 앞임 ·", time: "16분"),
    DM_Message(imageName: "DM_test2", storyOn: true, bf: true, name: "박스윗", isRead: false, talk: "내일 술 ㄱㄱ? ·", time: "14시간"),
    DM_Message(imageName: "DM_test3", storyOn: false, bf: false, name: "남궁우주", isRead: false, talk: "", time: "23시간"),
    DM_Message(imageName: "DM_test4", storyOn: true, bf: true, name: "김아요", isRead: false, talk: "오케잉 좀따 봐잉 :) ·", time: "1일"),
    DM_Message(imageName: "DM_test5", storyOn: true, bf: false, name: "이치킨", isRead: false, talk: "", time: "수요일에 읽음"),
    DM_Message(imageName: "DM_test6", storyOn: true, bf: false, name: "최피자", isRead: false, talk: "피자 깊티 보내드렸사옵니다 ㅎㅎ ·", time: "월요일에 읽음"),
    DM_Message(imageName: "DM_test7", storyOn: true, bf: false, name: "윤여인", isRead: false, talk: "dsdsddios_god님의 릴스를 보내셨습니다. ·", time: "7일"),
    DM_Message(imageName: "DM_test8", storyOn: false, bf: false, name: "오간지", isRead: false, talk: "", time: "전송됨")
]

#Preview {
    dongdong_DMView()
}
