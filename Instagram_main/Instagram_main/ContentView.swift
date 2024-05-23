//
//  ContentView.swift
//  Instagram_main
//
//  Created by 채리원 on 5/23/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TopBarView()
            
            TabBarIView()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
