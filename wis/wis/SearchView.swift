import SwiftUI
struct SearchView: View {
    let columns = [
        GridItem(.fixed(120)),
        GridItem(.fixed(120)),
        GridItem(.fixed(120))
    ]
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var selectedImage: String? = nil
    @State private var selectedAccount: String? = nil
    
    
    let accounts = ["Alice", "Bob", "Charlie", "David", "Eve", "Cherry", "Eva", "Dongdong", "Wis", "동동", "이바", "위즈", "체리", "이상엽", "이상해", "이상민", "이상훈", "이슬기"] // 등록된 계정 리스트
    let imageNames = (0..<30).map { "image\($0)" }
    var filteredAccounts: [String] {
        if searchText.isEmpty {
            return []
        } else {
            return accounts.filter { $0.contains(searchText) }
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                VStack(spacing: 10) {
                    HStack {
                        ZStack(alignment: .leading) {
                            HStack {
                                TextField("Search", text: $searchText)
                                    .padding(7)
                                    .padding(.leading, 30)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                                
                                if !searchText.isEmpty {
                                    Button(action: {
                                        searchText = ""
                                    }) {
                                        Image(systemName: "xmark.circle.fill")
                                            .foregroundColor(.gray)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                    .padding(.leading, 8)
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 1) {
                            ForEach(imageNames.indices, id: \.self) { index in
                                Image(imageNames[index])
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 127, height: 127)
                                    .clipped()
                                    .onTapGesture {
                                        selectedImage = imageNames[index]
                                    }
                            }
                        }
                    }
                    Spacer()
                }
                if !searchText.isEmpty {
                    VStack {
                        Spacer().frame(height: 40) // 검색창 아래에 리스트를 배치하도록 간격 조절
                        List(filteredAccounts, id: \.self) { account in
                            Button(action: {
                                selectedAccount = account
                                isSearching = true
                            }) {
                                HStack {
                                    ZStack {
                                        Circle()
                                            .strokeBorder(
                                                LinearGradient(
                                                    gradient: Gradient(colors: [Color.purple, Color.red, Color.yellow]),
                                                    startPoint: .topLeading,
                                                    endPoint: .bottomTrailing
                                                ),
                                                lineWidth: 3 // 테두리 두께를 늘림
                                            )
                                            .frame(width: 50, height: 50) // 테두리가 잘 보이도록 크기 조정
                                        Image(systemName: "person.circle.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.899))
                                            .frame(width: 45, height: 45) // 이미지 크기를 줄여 테두리가 더 잘 보이도록 함
                                    }
                                    VStack(alignment: .leading) {
                                        Text(account)
                                        Text(account)
                                            .font(.footnote)
                                            .foregroundColor(Color.gray)
                                    }
                                    Spacer()
                                }
                                .padding(.vertical, 5)
                            }
                            .listRowSeparator(.hidden) // 각 항목의 가로선을 숨김
                            .listRowInsets(EdgeInsets()) // 리스트 항목의 간격을 줄임
                        }
                        .listStyle(PlainListStyle())
                        .frame(maxHeight: 830) // 리스트 높이 제한
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10)
                    }
                }
                if let selectedImage = selectedImage {
                    ExploreView(imageName: selectedImage, isPresented: $selectedImage.isPresented)
                        .zIndex(1)
                        .animation(.easeInOut)
                        .transition(.opacity) // 화면 전환 애니메이션을 부드럽게
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // 전체 화면 차지
                }
            }
            
            .navigationTitle("")
            .navigationBarBackButtonHidden(true) // 상단의 뒤로가기 버튼을 숨김
        }
    }
}
extension Optional where Wrapped == String {
    var isPresented: Bool {
        get {
            self != nil
        }
        set {
            if !newValue {
                self = nil
            }
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
