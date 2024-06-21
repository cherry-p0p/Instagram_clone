import SwiftUI
import PhotosUI

struct DM_User: Identifiable {
    let id = UUID()
    let name: String
    let profileImage: String
    let username: String
    let storyOn: Bool
    let bf: Bool
}

let DM_users: [String: DM_User] = [
    "정멍뭉": DM_User(name: "정멍뭉", profileImage: "DM_test1", username: "mungmungworld", storyOn: true, bf: false),
    "박스윗": DM_User(name: "박스윗", profileImage: "DM_test2", username: "sweeeet_park", storyOn: true, bf: true),
    "남궁우주": DM_User(name: "남궁우주", profileImage: "DM_test3", username: "universal.man", storyOn: false, bf: false),
    "김아요": DM_User(name: "김아요", profileImage: "DM_test4", username: "ios_is_god", storyOn: true, bf: true),
    "이치킨": DM_User(name: "이치킨", profileImage: "DM_test5", username: "ilike_chicken", storyOn: true, bf: false),
    "최피자": DM_User(name: "최피자", profileImage: "DM_test6", username: "pizza_goodboy", storyOn: true, bf: false),
    "윤여인": DM_User(name: "윤여인", profileImage: "DM_test7", username: "yoon_vely", storyOn: true, bf: false),
    "오간지": DM_User(name: "오간지", profileImage: "DM_test8", username: "gangganglife", storyOn: false, bf: false)
]



struct dongdong_DMChatView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var userName: String
    var user: DM_User {
        return DM_users[userName] ?? DM_User(name: "", profileImage: "", username: "", storyOn: false, bf: false)
    }
    
    @State private var DM_messages: [DM_MessageType] = []
    
    
    // 현재 데이터 셋의 시점 : 토요일 오후
    @State private var DM_allMessages: [String: [DM_MessageType]] = [
        "정멍뭉": [
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "야야 내가 요 근처에 진짜 귀여운 애견카페 발견함")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "거기 수플레도 파는데 죵맛탱임 ㄹㅇ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "수욜에 ㄱ?")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "어딘데?")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "복정 쪽")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "ㄹㅇ 가까움")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "ㅇㅋㅇㅋ ㄱㄱ")),
            .timestampMessage(DM_TimestampMessage(id: UUID(), timestamp: "(토) 오후 2:20")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "야 ㅇㄷ냐")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "나 곧 버스 내림")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "ㅇㅋㅇㅋ 나 가게 앞임"))
        ],
        "박스윗": [
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "롤 들어오셈 ㄱㄱ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "ㄱㄷㄱㄷ 나 밥만 먹고")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "ㅇㅋㅇㅋ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "밥 다 먹음")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "두가자~")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "기릿")),
            .timestampMessage(DM_TimestampMessage(id: UUID(), timestamp: "(화) 오후 9:43")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "헤이헤이")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "와이와이")),
            .timestampMessage(DM_TimestampMessage(id: UUID(), timestamp: "(수) 오전 11:20")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "목욜은 안됨??")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "애들이 목욜이 좋다고 그래가지고")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "목욜은 프젝 바쁨??")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "ㅇㅇ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "미정이긴 한데")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "뭐 저녁이면 될듯 ㅇㅇ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "Maybe?")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "ㅇㅋㅇ 바리바리수타")),
            .timestampMessage(DM_TimestampMessage(id: UUID(), timestamp: "(토) 오전 12:07")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "내일 술 ㄱㄱ?"))
        ],
        "남궁우주": [
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "난 우주의 신비에 대해서 공부중이오 동동쿤")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "쉽지 않네")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "우주는 만물의 근원이며 모든 이의 어머니이지")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "진짜 쉽지 않네")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "우주에 대해서 같이 공부해보는 건 어떤 가 동동쿤")),
            .timestampMessage(DM_TimestampMessage(id: UUID(), timestamp: "(금) 오후 9:43")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "동동쿤? 어째서 대답이 없는 것인가..?")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "미안 난 생각없어 연락하지말아줘.")),
        ],
        "김아요": [
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "동동~ 워크북 어디까지 했어??")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "나 오늘 시작해서 아직 많이 못했어!")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "아 진짜? ㅋㅋㅋㅋㅋㅋ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "그럼 하리보 들어오셈! 다 여기있어")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "오늘 켠왕 ㄱㄱ하자")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "레츠기릿")),
            .timestampMessage(DM_TimestampMessage(id: UUID(), timestamp: "(목) 오후 9:43")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "이번 건 좀 빡세네...")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "와이와이")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "api 연동시키는 건데 잘 안돼ㅠ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "그거 api guide 있어 ㄱㄷ 링크 보내줄게")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "https://www.apiguide.com")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "와 진짜 고마워!! 동동 땡큐~")),
            .timestampMessage(DM_TimestampMessage(id: UUID(), timestamp: "(금) 오전 1:10")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "크으으 드뎌 성공했네 휴")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "좋았따 네이스~ 좀따 스터디 때 보자고 ㅃㅃ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "오케잉 좀따 봐잉 :)")),
        ],
        "이치킨": [
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "오랜만에 수업 끝나고 치맥 ㄱ?")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "ㅇㅋㅇㅋ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "ㅇㄷ?")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "나 방금 수업 끝남 AI관임")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "ㅇㅋ 글로 감")),
            .timestampMessage(DM_TimestampMessage(id: UUID(), timestamp: "(목) 오후 11:25")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "2만원 보내셈"))
        ],
        "최피자": [
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "동동동동동 나 급그브급해")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "왜왜어ㅐ오애오애")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "나 과제 급해급해그랩해")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "먼데")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "교양...지성학 대체보고서...")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "도와주십셔 형님...")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "ㄱㄷㄱㄷ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "야 이메일로 과제 보냈따.")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "감사합니다 형님ㅠㅠ")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "피자 깊티 보내드렸사옵니다 ㅎㅎ"))
        ],
        "윤여인": [
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "dsdsddios_god님의 릴스를 보내셨습니다."))
        ],
        "오간지": [
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "야 나 월급 개많이 받음")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "오늘은 회 쏘다 드루온나")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: false, text: "이 형님께서 사주도록 하지")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "역시역시 오.간.지 형님이십니다 헤헿^^")),
            .chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: "Yummy~"))
        ]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding(.leading, 16)
                        .font(.title2)
                }
                
                if user.storyOn {
                    if user.bf {
                        Image(user.profileImage)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .padding(2)
                            .overlay(
                                Circle()
                                    .stroke(Color.green, lineWidth: 2)
                                    .padding(2)
                            )
                            .padding(.leading, 10)
                    }
                    else {
                        Image(user.profileImage)
                            .resizable()
                            .frame(width: 40, height: 40)
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
                            .padding(.leading, 10)
                    }
                }
                else {
                    Image(user.profileImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .padding(2)
                        .overlay(
                            Circle()
                                .stroke(Color.gray, lineWidth: 2)
                                .padding(2)
                        )
                        .padding(.leading, 10)
                }
                
                
                
                VStack(alignment: .leading) {
                    Text(user.name)
                        .foregroundColor(.black)
                        .font(.headline)
                    Text(user.username)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: {
                    }) {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                            .font(.title2)
                    }
                    
                    Button(action: {
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
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(DM_messages) { messageType in
                        switch messageType {
                        case .chatMessage(let message):
                            DM_MessageView(isCurrentUser: message.isCurrentUser, text: message.text, userImage: user.profileImage)
                        case .timestampMessage(let timestampMessage):
                            DM_TimestampView(timestamp: timestampMessage.timestamp)
                        }
                    }
                }
                .padding()
            }
            DM_ChatInputView(sendMessage: sendMessage)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            loadMessages()
        }
    }
    
    func loadMessages() {
        DM_messages = DM_allMessages[userName] ?? []
    }
    
    func sendMessage(_ text: String) {
        guard !text.isEmpty else { return }
        let newMessage = DM_MessageType.chatMessage(DM_ChatMessage(id: UUID(), isCurrentUser: true, text: text))
        DM_messages.append(newMessage)
        DM_allMessages[userName]?.append(newMessage)
    }
}

struct DM_ChatMessage: Identifiable {
    let id: UUID
    let isCurrentUser: Bool
    let text: String
}

struct DM_TimestampMessage: Identifiable {
    let id: UUID
    let timestamp: String
}

struct DM_MessageView: View {
    var isCurrentUser: Bool
    var text: String
    var userImage: String
    
    var body: some View {
        HStack {
            if !isCurrentUser {
                Image(userImage)
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

struct DM_TimestampView: View {
    var timestamp: String
    
    var body: some View {
        Text(timestamp)
            .foregroundColor(.gray)
            .font(.footnote)
            .padding(.vertical, 5)
    }
}

enum DM_MessageType: Identifiable {
    case chatMessage(DM_ChatMessage)
    case timestampMessage(DM_TimestampMessage)
    
    var id: UUID {
        switch self {
        case .chatMessage(let message):
            return message.id
        case .timestampMessage(let message):
            return message.id
        }
    }
}

struct DM_ChatInputView: View {
    @State private var DM_messageText: String = ""
    @State private var DM_isRecording: Bool = false
    @State private var DM_isShowingPhotoPicker: Bool = false
    @State private var DM_selectedImages: [UIImage] = []
    
    var sendMessage: (String) -> Void

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if DM_isRecording {
                    HStack {
                        Button(action: {
                            DM_isRecording.toggle()
                        }) {
                            Image(systemName: "trash")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(3)
                                .background(Circle().fill(Color.white))
                                .overlay(
                                    Circle().stroke(Color.gray, lineWidth: 1)
                                )
                        }
                        Spacer()
                        Text("0:00")
                            .foregroundColor(.white)
                        Image(systemName: "arrow.up")
                            .foregroundColor(.white)
                    }
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                } else {
                    Button(action: {
                        // Action
                    }) {
                        Image(systemName: "camera.circle.fill")
                            .font(.title)
                    }
                    
                    TextField("메시지 보내기...", text: $DM_messageText)
                        .padding(10)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                        .foregroundColor(.black)
                    
                    Button(action: {
                        sendMessage(DM_messageText)
                        DM_messageText = ""
                    }) {
                        Image(systemName: "paperplane")
                            .foregroundColor(.black)
                    }
                    
                    Button(action: {
                        DM_isShowingPhotoPicker.toggle()
                    }) {
                        Image(systemName: "photo")
                            .foregroundColor(.black)
                    }
                    .sheet(isPresented: $DM_isShowingPhotoPicker) {
                        PhotoPicker(selectedImages: $DM_selectedImages)
                    }
                    
                    Button(action: {
                        DM_isRecording.toggle()
                    }) {
                        Image(systemName: "mic")
                            .foregroundColor(.black)
                    }
                    
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)

            if !DM_selectedImages.isEmpty {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(DM_selectedImages, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding()
                }
            }
        }
    }
}


struct PhotoPicker: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 0 // 0 = no limit
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        var parent: PhotoPicker

        init(_ parent: PhotoPicker) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)

            for result in results {
                if result.itemProvider.canLoadObject(ofClass: UIImage.self) {
                    result.itemProvider.loadObject(ofClass: UIImage.self) { image, _ in
                        if let uiImage = image as? UIImage {
                            DispatchQueue.main.async {
                                self.parent.selectedImages.append(uiImage)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    dongdong_DMChatView(userName: "박스윗")
}
