//
//  TopBarView.swift
//  Instagram_main
//
//  Created by 채리원 on 5/23/24.
//

import SwiftUI

struct cherry_TopBarView: View {
    var body: some View {
        HStack {
            Image("TopBar_1")
                .padding(.leading, 15)
            Spacer()
            Image("TopBar_2")
                .padding(.trailing, 10)
            Image("TopBar_3")
                .padding(.trailing, 15)
        }
        Spacer()
        
    }
}
 
#Preview {
    cherry_TopBarView()
}
