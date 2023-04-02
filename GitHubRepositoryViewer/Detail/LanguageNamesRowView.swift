//
//  LanguageNamesRowView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/04/03.
//

import Foundation
import SwiftUI
struct LanguageNamesRowView : View{
    var languages : [String]
    var body : some View{
        ForEach(0..<languageNames.count) { i in
            Text(languageNames[i])
        }
    }
}
