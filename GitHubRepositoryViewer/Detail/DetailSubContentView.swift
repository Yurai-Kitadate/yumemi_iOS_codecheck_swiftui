//
//  DetailSubContentView.swift
//  GitHubRepositoryViewer
//
//  Created by 北舘友頼 on 2023/04/02.
//

import Foundation
import SwiftUI
struct DetailSubContentView : View{
    var repository : Repository
    @State var languages : [String:Int] = [:]
    var body : some View{
        DetailItemView(itemName: "description",contentView: Text(repository.description ?? "").padding(5))
        
        DetailItemView(itemName: "language",contentView:LanguageListView(input: languages))
    }
}

