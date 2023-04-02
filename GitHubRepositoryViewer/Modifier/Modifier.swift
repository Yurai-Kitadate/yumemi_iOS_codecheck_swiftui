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
            Button(action: { print("Action 1 triggered") }, label:
                    {
                Image(systemName: "bookmark.circle")
                Text("ブックマーク")
                    .foregroundColor(.red)
            })
            
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

struct BookmarkContextMenuModifier: ViewModifier {
    var searchWord : String?
    func body(content: Content) -> some View {
        content
            .contextMenu
        {
            Button(action: { print("Action 1 triggered") }, label:
                    {
                Image(systemName: "trash")
                Text("削除")
                    .foregroundColor(.red)
            })
            
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
