import SwiftUI

// <<< 추가해야 할 기능>>>
// 스토리 읽으면 회색으로 바뀌는 기능 -> 구조체 요소 재정립 필요?
// 사용자 검색 기능
// 메모 기능 좀 더 완벽하게 구현

struct DMView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HeaderView()
                MessageListView()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
                .padding(.leading, 18)
                .font(.system(size: 25))
                .fontWeight(.semibold)
            
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

struct SearchBarView: View {
    @State private var searchText = ""
    
    var body: some View {
        HStack {
            TextField("🔍 검색", text: $searchText)
                .padding(8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .foregroundColor(.black)
                .padding(.horizontal, 16)
        }
        .padding(.bottom, 10)
    }
}

struct MessageListView: View {
    var body: some View {
        ScrollView {
            VStack {
                SearchBarView()
                MemoView(memos: memos)
                
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
                
                ForEach(messages) { message in
                    MessageRowView(message: message)
                }
            }
            .padding(.top, 8)
        }
    }
}

struct MemoView: View {
    
    var memos: [Memo]

    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(memos) { memo in
                    VStack {
                        Image(memo.imageName)
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .overlay(
                                Circle().stroke(Color.gray, lineWidth: 1)
                            )
                        
                        VStack {
                            Text(memo.name)
                                .font(.subheadline)
                                .foregroundColor(.black)
                                .font(.body)
                            Text(memo.userMemo)
                                .bold()
                                .font(.subheadline)
                        }
                        .frame(width: 80)
                    }
                }
            }
            .padding(.horizontal, 10)
        }
    }
}

struct MessageRowView: View {
    var message: Message
    
    var body: some View {
        HStack {
            
            if message.storyOn {
                if message.bf {
                    Image(message.imageName)
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
                else {
                    Image(message.imageName)
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
            else {
                Image(message.imageName)
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
            
            VStack(alignment: .leading) {
                Text(message.name)
                    .foregroundColor(.black)
                    .font(.body)
                    .bold()
                
                if message.isRead {
                    Text(message.time)
                        .foregroundColor(.gray)
                        .font(.footnote)
                }
                
                else {
                    HStack {
                        Text(message.talk)
                            .foregroundColor(.gray)
                            .font(.footnote)
                            .lineLimit(1)
                            .truncationMode(.tail)
                        
                        Text(message.time)
                            .foregroundColor(.gray)
                            .font(.footnote)
                        
                    }
                }
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Image(systemName: "camera")
                .font(.system(size: 20))
                .foregroundColor(.gray)
                .padding(.leading, 10)
                .padding(.trailing, 16)
                .bold()
        }
        .padding(.vertical, 8)
    }
}

struct Memo: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let userMemo: String
}

struct Message: Identifiable {
    let id = UUID()
    let imageName: String
    let storyOn: Bool
    let bf: Bool
    let name: String
    let isRead: Bool
    let talk: String
    let time: String
}

let memos = [
    Memo(imageName: "test9", name: "김장발", userMemo: "오늘 날씨 굿"),
    Memo(imageName: "test11", name: "황보곰", userMemo: "졸리당"),
    Memo(imageName: "test1", name: "정멍뭉", userMemo: "배고픈데?"),
    Memo(imageName: "test8", name: "오간지", userMemo: "Hello"),
    Memo(imageName: "test4", name: "김아요", userMemo: "아 뭐 먹지"),
    Memo(imageName: "test5", name: "이치킨", userMemo: "심심하다...")
]

let messages = [
    Message(imageName: "test1", storyOn: true, bf: false, name: "정멍뭉",isRead: false, talk: "야 밥 언제 먹을거야 · ", time: "16분"),
    Message(imageName: "test2", storyOn: true, bf: true, name: "박스윗", isRead: false, talk: "내일 술 ㄱㄱ? · ", time: "14시간"),
    Message(imageName: "test3", storyOn: false, bf: false, name: "남궁우주", isRead: true, talk: "", time: "화요일에 읽음"),
    Message(imageName: "test4", storyOn: true, bf: true, name: "김아요", isRead: false, talk: "dsdsddios_god님의 릴스를 보내셨습니다. · ", time: "17시간"),
    Message(imageName: "test5", storyOn: true, bf: false, name: "이치킨", isRead: true, talk: "", time: "월요일에 읽음"),
    Message(imageName: "test6", storyOn: true, bf: false, name: "최피자", isRead: false, talk: "피자 깊티 보내드림 · ", time: "3일"),
    Message(imageName: "test7", storyOn: true, bf: false, name: "윤여인", isRead: true, talk: "", time: "일요일에 읽음"),
    Message(imageName: "test8", storyOn: true, bf: true, name: "오간지", isRead: false, talk: "내 인생에 빠꾸란 읍따 · ", time: "6시간"),
    Message(imageName: "test9", storyOn: true, bf: true, name: "김장발", isRead: false, talk: "내 머릿결을 위해서 난 트리트먼트를 한닷! · ", time: "5분"),
    
    Message(imageName: "test10", storyOn: false, bf: false, name: "제갈소녀", isRead: true, talk: "", time: "토요일에 읽음"),
    Message(imageName: "test11", storyOn: true, bf: false, name: "황보곰", isRead: false, talk: "연어 맛집 추천좀;; · ", time: "20시간"),
    Message(imageName: "test12", storyOn: true, bf: false, name: "이고양", isRead: true, talk: "", time: "지난주에 읽음"),
]

#Preview {
    DMView()
}
