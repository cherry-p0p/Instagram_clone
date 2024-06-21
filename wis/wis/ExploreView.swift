import SwiftUI

struct ExploreView: View {
    var imageName: String
    @Binding var isPresented: Bool
    @State private var isLiked: Bool = false
    @State private var isBookmarked: Bool = false
    @State private var isFollowing: Bool = false
    @State private var likesCount: Int = 722
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isPresented = false
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                }
                Spacer()
                Text("Explore       ")
                    .fontWeight(.bold)
                Spacer()
            }
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.836))
                    .frame(width: 50, height: 50)
                VStack {
                    Text("g.io_evasang_pro")//계정
                        .fontWeight(.bold)
                    Text("Suggested for you         ")
                        .font(.footnote)
                }
                Spacer()
                Button(action: {
                    isFollowing.toggle()
                }) {
                    Text(isFollowing ? "Following" : "Follow")
                        .frame(minWidth: 50) // 최소 너비 설정
                        .frame(height: 5)
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color(hue: 1.0, saturation: 0.0, brightness: 0.861))
                        .foregroundColor(.black)
                        .cornerRadius(8)
                }
                Button(action: {
                    // Action for more options
                }) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                }
            } // HStack
            .padding(.horizontal)
            
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            HStack(spacing: 20) {
                Button(action: {
                    isLiked.toggle()
                    likesCount += isLiked ? 1 : -1
                }) {
                    Image(systemName: isLiked ? "heart.fill" : "heart")
                        .resizable()
                        .foregroundColor(isLiked ? .red : .black)
                        .frame(width: 30, height: 28)
                }.padding(.leading)
                Button(action: {
                    // Action for comment button
                }) {
                    Image(systemName: "message")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                }
                Button(action: {
                    // Action for share button
                }) {
                    Image(systemName: "paperplane")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                }
                Spacer()
                Button(action: {
                    isBookmarked.toggle()
                }) {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .foregroundColor(isBookmarked ? .black : .black)
                        .frame(width: 25, height: 25)
                }.padding(.trailing)
            } // HStack
            
            HStack {
                Text("\(likesCount) likes")
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal, 20)
            
            HStack {
                Text("g.io_evasang_pro")
                    .fontWeight(.bold)
                Text("배고파요")
                Spacer()
            }
            .padding(.horizontal, 20)
            
            HStack {
                Text("#인스타그램 #스위프트")
                    .foregroundColor(Color(red: 0.02, green: 0.22, blue: 0.42))
                Spacer()
            }
            .padding(.horizontal, 20)
            
            HStack {
                Text("View all 6 comments")
                    .foregroundColor(Color.gray)
                Spacer()
            }
            .padding(.horizontal, 20)
            
            HStack {
                Text("45 minutes ago ·")
                    .foregroundColor(Color.gray)
                Text("See Translation")
                    .fontWeight(.bold)
                Spacer()
            }
            .padding(.horizontal, 20)
            
            Spacer()
        } // VStack
        .background(Color.white)
        .transition(.move(edge: .bottom))
        .frame(maxHeight: .infinity)
    }
}

struct ExploreView_Previews: PreviewProvider {
    @State static var isPresented = true
    
    static var previews: some View {
        ExploreView(imageName: "minji", isPresented: $isPresented)
    }
}
