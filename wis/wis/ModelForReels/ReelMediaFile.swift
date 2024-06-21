//
//  MediaFile.swift
//  Instagram
//
//  Created by 김동섭 on 6/6/24.
//

import SwiftUI

struct ReelMediaFile: Identifiable {

    var id = UUID().uuidString
    var url: String
    var isExpanded: Bool = false
}

var ReelMediaFileJSON = [
    ReelMediaFile(url: "Reel1"),
    ReelMediaFile(url: "Reel2"),
    ReelMediaFile(url: "Reel3"),
    ReelMediaFile(url: "Reel4")
]
