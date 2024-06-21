import SwiftUI

struct cherry_TopBarView: View {
    var body: some View {
        NavigationView {
            HStack {
                Image("TopBar_1")
                    .padding(.leading, 15)
                Spacer()
                Image("TopBar_2")
                    .padding(.trailing, 10)
                NavigationLink(destination: dongdong_DMView()) {
                    Image("TopBar_3")
                        .padding(.trailing, 15)
                }
            }
            Spacer()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    cherry_TopBarView()
}
