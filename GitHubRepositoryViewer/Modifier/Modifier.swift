//
//  Modifier.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/04/02.
//

import Foundation
import SwiftUI

struct SearchContextMenuModifier: ViewModifier {
    var searchWord : String?
    func body(content: Content) -> some View {
        content
            .contextMenu
        {
            Button(action: {
                UIPasteboard.general.string = "https://github.com/" + (searchWord ?? "")
                
            }, label:
                    {
                Image(systemName: "doc.on.doc")
                Text("リンクをコピー")
            })
            
        }
    }
}

