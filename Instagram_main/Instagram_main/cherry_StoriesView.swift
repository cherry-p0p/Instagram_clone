//
//  StoriesView.swift
//  Instagram_main
//
//  Created by 채리원 on 5/23/24.
//

import SwiftUI


struct cherry_StoriesView: View {
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                VStack {
                    ZStack {
                        Image("Stories_1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                        
                        Image("Stories_2")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                    
                    Text("iOS")
                }
                
                VStack {
                    ZStack {
                        Image("Stories_1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                        
                        Image("Stories_3")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                    
                    Text("dongdong")
                }
                
                VStack {
                    ZStack {
                        Image("Stories_1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                        
                        Image("Stories_4")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                    
                    Text("eva")
                }
                
                VStack {
                    ZStack {
                        Image("Stories_1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                        
                        Image("Stories_5")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                    
                    Text("wis")
                }
                
                VStack {
                    ZStack {
                        Image("Stories_1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                        
                        Image("Stories_6")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                    }
                    
                    Text("cherry")
                }
            }
        }
    }
}

#Preview {
    cherry_StoriesView()
}
