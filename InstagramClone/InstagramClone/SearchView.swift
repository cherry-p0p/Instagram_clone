import SwiftUI

struct SearchView: View {
    let rows = [
        GridItem(.fixed(100))
    ]
    let columns = [
            GridItem(.fixed(120)),
            GridItem(.fixed(120)),
            GridItem(.fixed(120))
        ]
    let buttonName = ["TV", "Shop", "Style", "Sports" ,"Auto", "Hello"]
    @State private var searchText = ""
    
    let items = (0..<30).map { "Item \($0)" }
        
        var filteredItems: [String] {
            if searchText.isEmpty {
                return items
            } else {
                return items.filter { $0.contains(searchText) }
            }
        }
    
    var body: some View {
        
        VStack(spacing: 10){
            HStack {
                        ZStack(alignment: .leading) {
                            
                            TextField("Search", text: $searchText)
                                .padding(.leading, 30) // 이미지와 텍스트 간의 간격 조절
                                .padding(7)
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.black)
                                Spacer()
                            }
                        }
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        
                        Image(systemName: "camera.metering.partial")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.gray)
                            .frame(width: 30, height: 30)
                            .padding(.leading, 8) // 텍스트 필드와 이미지 간의 간격 조절
                    }//HStack
                    .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 10) {
                    ForEach(buttonName, id: \.self) { buttonNames in
                        Text(buttonNames)
                            .cornerRadius(15)
                            .frame(width: 100, height: 40)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color.gray, lineWidth: 1)
                                        .frame(width: 100, height: 40)
                                        )
                    }
                }
                .padding(.horizontal)
                .frame(height: 60)
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 1) {
                    ForEach(0..<30) { index in
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 127, height: 127)
                            .overlay(Text("\(index)").foregroundColor(.white))
                    }
                }
                
            }
            Spacer()
        } //VStack
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
